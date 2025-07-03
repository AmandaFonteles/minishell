/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc_parsing.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:01 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 12:37:09 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static int	count_heredocs(t_token *cur)
{
	int	count;

	count = 0;
	while (cur)
	{
		if (cur->type == HERE_DOC && cur->next)
			count++;
		cur = cur->next;
	}
	return (count);
}

int	fill_heredocs(t_pars_cmd *cmd)
{
	t_token	*cur;
	int		i;

	cmd->hd_nb = count_heredocs(*(cmd->token));
	if (cmd->hd_nb == 0)
		return (1);
	cmd->delimiters = malloc(sizeof(char *) * (cmd->hd_nb + 1));
	if (!cmd->delimiters)
		return (0);
	cur = *(cmd->token);
	i = 0;
	while (cur)
	{
		if (cur->type == HERE_DOC && cur->next)
		{
			cmd->delimiters[i] = ft_strdup(cur->next->word);
			if (!cmd->delimiters[i++])
				return (free_arraystr(cmd->delimiters),
					cmd->delimiters = NULL, 0);
		}
		cur = cur->next;
	}
	cmd->delimiters[i] = NULL;
	return (1);
}
