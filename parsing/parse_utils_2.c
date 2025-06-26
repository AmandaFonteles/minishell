/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse_utils_2.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/26 13:25:38 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 14:02:13 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

t_pars_cmd	*ft_lstlast_cmds(t_pars_cmd *cmd)
{
	if (!cmd)
		return (NULL);
	while (cmd->next)
		cmd = cmd->next;
	return (cmd);
}

void	ft_shell_add_back(t_pars_cmd **cmds, t_pars_cmd *new)
{
	t_pars_cmd	*temp;

	temp = *cmds;
	temp = ft_lstlast_cmds(temp);
	if (!temp)
		*cmds = new;
	else
		temp->next = new;
}

int	count_cmds(t_pars_cmd *cmd_list)
{
	t_pars_cmd	*cur;
	int			count;

	count = 0;
	cur = cmd_list;
	while (cur)
	{
		count++;
		cur = cur->next;
	}
	return (count);
}

t_pars_cmd	*ft_lstnew_cmd(char *cmd, int cmd_index)
{
	t_pars_cmd	*new;

	new = ft_calloc(1, sizeof(t_pars_cmd));
	if (!new)
		return (NULL);
	new->cmd = cmd;
	new->cmd_index = cmd_index;
	new->pid = 0;
	new->hd_nb = 0;
	new->heredoc = NULL;
	new->delimiters = NULL;
	new->infile = NULL;
	new->outfile = NULL;
	new->append = 0;
	new->args = NULL;
	new->next = NULL;
	return (new);
}
