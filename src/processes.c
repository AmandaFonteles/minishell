/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   processes.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 17:36:18 by afontele          #+#    #+#             */
/*   Updated: 2025/07/07 13:45:52 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	create_processes(t_minishell *data)
{
	t_pars_cmd	*cur_cmd;

	cur_cmd = data->cmd_list;
	while (cur_cmd)
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
		cur_cmd = cur_cmd->next;
	}
	close_all_pipes(data);
	wait_loop(data);
	return (1);
}

void	setup_child(t_minishell *data, t_pars_cmd *cur_cmd)
{
	int	idx;

	signal(SIGQUIT, SIG_DFL);
	signal(SIGINT, ft_signal_cat);
	idx = cur_cmd->cmd_index;
	if (data->cmd_nb > 1)
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
	close_unused_pipes(data, cur_cmd);
	if (!setup_redirections(cur_cmd))
	{
		free_to_exit(data);
		exit(1);
	}
}

void	wait_loop(t_minishell *data)
{
	t_pars_cmd	*cur_cmd;
	int			status;
	int			sig;

	cur_cmd = data->cmd_list;
	while (cur_cmd)
	{
		waitpid(cur_cmd->pid, &status, 0);
		if (WIFEXITED(status))
			g_exit_flag = WEXITSTATUS(status);
		else if (WIFSIGNALED(status))
		{
			sig = WTERMSIG(status);
			if (sig == SIGQUIT)
				write(2, "Quit (core dumped)\n", 20);
			g_exit_flag = 128 + sig;
		}
		cur_cmd = cur_cmd->next;
	}
}
