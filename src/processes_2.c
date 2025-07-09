/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   processes_2.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 23:34:33 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 23:38:35 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	fork_process(t_minishell *data, t_pars_cmd *cur_cmd)
{
	cur_cmd->pid = fork();
	if (cur_cmd->pid == -1)
	{
		error_and_prompt_back("error forking");
		close_all_pipes(data);
		return (0);
	}
	if (cur_cmd->pid == 0)
	{
		setup_child(data, cur_cmd);
		if (cur_cmd->args && cur_cmd->args[0])
			execute(data, cur_cmd);
		free_to_exit(data);
		exit(g_exit_flag);
	}
	return (1);
}

void	handle_prev_pipe(t_minishell *data, int idx)
{
	if (idx > 0)
	{
		if (!safe_dup2(data->pipe_ends[idx - 1][0], STDIN_FILENO))
		{
			close_all_pipes(data);
			error_to_exit(data, "dup2 in setup_child (stdin)");
		}
		close(data->pipe_ends[idx - 1][0]);
		data->pipe_ends[idx - 1][0] = -1;
	}
}

void	handle_next_pipe(t_minishell *data, int idx)
{
	if (idx < data->cmd_nb - 1)
	{
		if (!safe_dup2(data->pipe_ends[idx][1], STDOUT_FILENO))
		{
			close_all_pipes(data);
			error_to_exit(data, "dup2 in setup_child (stdout)");
		}
		close(data->pipe_ends[idx][1]);
		data->pipe_ends[idx][1] = -1;
	}
}

void	update_exit_status(int status, int *pt_quit)
{
	int	sig;

	if (WIFEXITED(status))
		g_exit_flag = WEXITSTATUS(status);
	else if (WIFSIGNALED(status))
	{
		sig = WTERMSIG(status);
		if (sig == SIGQUIT && !*pt_quit)
		{
			write(2, "Quit (core dumped)\n", 20);
			*pt_quit = 1;
		}
		g_exit_flag = 128 + sig;
	}
}
