/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:56:58 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 22:55:29 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static int	handle_infile_redir(t_pars_cmd *cmd)
{
	if (cmd->infile)
		return (open_infile(cmd));
	if (cmd->heredoc && cmd->heredoc[0])
		return (redirect_heredoc(cmd));
	return (1);
}

static int	process_out_token(t_token *cur, int *last_fd, char **filename)
{
	int	append;

	if (!(cur->type == FILE_OUT || cur->type == FILE_OUT_SUR))
		return (1);
	if (!cur->next || !cur->next->word)
		return (1);
	if (*filename)
		free(*filename);
	*filename = ft_strdup(cur->next->word);
	if (!*filename)
		return (0);
	append = (cur->type == FILE_OUT_SUR);
	if (*last_fd != -1)
		close(*last_fd);
	if (append)
		*last_fd = open(*filename, O_WRONLY | O_CREAT | O_APPEND, 0644);
	else
		*last_fd = open(*filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (*last_fd == -1)
		return (error_and_prompt_back(*filename), free(*filename), 0);
	return (1);
}

static int	finish_last_out(int last_fd, char *filename)
{
	if (last_fd == -1)
		return (1);
	if (!dup2(last_fd, STDOUT_FILENO))
	{
		close(last_fd);
		free(filename);
		return (0);
	}
	close(last_fd);
	free(filename);
	return (1);
}

int	setup_redirections(t_pars_cmd *cmd)
{
	t_token	*cur;
	int		last_fd;
	char	*filename;

	cur = *(cmd->token);
	last_fd = -1;
	filename = NULL;
	if (!handle_infile_redir(cmd))
		return (0);
	if (cmd->token && *(cmd->token))
	{
		while (cur)
		{
			if (!process_out_token(cur, &last_fd, &filename))
				return (0);
			cur = cur->next;
		}
		if (!finish_last_out(last_fd, filename))
			return (0);
	}
	return (1);
}
