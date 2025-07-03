/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redir_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/01 16:47:56 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 16:56:00 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	handle_infile(t_pars_cmd *cmd, t_token *cur)
{
	if (cur->type == FILE_IN && cur->next
		&& cur->next->type == OPEN_FILE && cur->next->word)
	{
		cmd->infile = ft_strdup(cur->next->word);
		if (!cmd->infile)
			return (0);
	}
	return (1);
}

int	handle_outfile(t_pars_cmd *cmd, t_token *cur)
{
	if (cur->type == FILE_OUT && cur->next
		&& cur->next->type == EXIT_FILE && cur->next->word)
	{
		cmd->outfile = ft_strdup(cur->next->word);
		cmd->append = 0;
		if (!cmd->outfile)
			return (0);
	}
	return (1);
}

int	handle_append(t_pars_cmd *cmd, t_token *cur)
{
	if (cur->type == FILE_OUT_SUR && cur->next
		&& cur->next->type == EXIT_FILE_RET && cur->next->word)
	{
		cmd->outfile = ft_strdup(cur->next->word);
		cmd->append = 1;
		if (!cmd->outfile)
			return (0);
	}
	return (1);
}
