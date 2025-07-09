/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   uniq_cmd.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 16:38:07 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 16:38:39 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static void	exec_child(t_minishell *data, t_pars_cmd *cmd)
{
	signal(SIGQUIT, SIG_DFL);
	signal(SIGINT, SIG_DFL);
	if (!setup_redirections(cmd))
	{
		free_to_exit(data);
		exit(1);
	}
	if (cmd->args && cmd->args[0])
		execute(data, cmd);
	free_to_exit(data);
	exit(0);
}

static void	handle_status(int status)
{
	if (WIFEXITED(status))
		g_exit_flag = WEXITSTATUS(status);
	else if (WIFSIGNALED(status))
	{
		if (WTERMSIG(status) == SIGINT)
			g_exit_flag = 130;
		else if (WTERMSIG(status) == SIGQUIT)
			write(2, "Quit (core dumped)\n", 20);
		g_exit_flag = 128 + WTERMSIG(status);
	}
}

void	exec_uniq_cmd(t_minishell *data)
{
	int		status;
	t_pars_cmd	*cmd;

	cmd = data->cmd_list;
	cmd->pid = fork();
	if (cmd->pid == -1)
	{
		error_and_prompt_back("error fork");
		return ;
	}
	if (cmd->pid == 0)
		exec_child(data, cmd);
	waitpid(cmd->pid, &status, 0);
	handle_status(status);
}
