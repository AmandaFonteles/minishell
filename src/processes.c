/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   processes.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 17:36:18 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 23:37:32 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	create_processes(t_minishell *data)
{
	t_pars_cmd	*cur_cmd;

	signal(SIGINT, ft_signal_cat);
	signal(SIGQUIT, SIG_IGN);
	cur_cmd = data->cmd_list;
	while (cur_cmd)
	{
		if (!fork_process(data, cur_cmd))
			return (0);
		cur_cmd = cur_cmd->next;
	}
	close_all_pipes(data);
	wait_loop(data);
	signal(SIGINT, ft_signal);
	signal(SIGQUIT, SIG_IGN);
	return (1);
}

void	setup_child(t_minishell *data, t_pars_cmd *cur_cmd)
{
	int	idx;

	signal(SIGQUIT, SIG_DFL);
	signal(SIGINT, SIG_DFL);
	idx = cur_cmd->cmd_index;
	if (data->cmd_nb > 1)
	{
		handle_prev_pipe(data, idx);
		handle_next_pipe(data, idx);
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
	int			pt_quit;

	cur_cmd = data->cmd_list;
	pt_quit = 0;
	while (cur_cmd)
	{
		waitpid(cur_cmd->pid, &status, 0);
		update_exit_status(status, &pt_quit);
		cur_cmd = cur_cmd->next;
	}
}
