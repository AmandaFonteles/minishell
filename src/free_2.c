/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free_2.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 14:50:48 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:51:50 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	free_arraystr(char **arr)
{
	int	i;

	i = 0;
	while (arr && arr[i])
		free(arr[i++]);
	free(arr);
}

void	cleanup_heredocs(t_minishell *data)
{
	t_pars_cmd	*cmd;
	int			i;

	cmd = data->cmd_list;
	while (cmd)
	{
		if (cmd->heredoc)
		{
			i = 0;
			while (cmd->heredoc[i])
			{
				unlink(cmd->heredoc[i]);
				free(cmd->heredoc[i]);
				cmd->heredoc[i] = NULL;
				i++;
			}
			free(cmd->heredoc);
			cmd->heredoc = NULL;
		}
		cmd = cmd->next;
	}
}
