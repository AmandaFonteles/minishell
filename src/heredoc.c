/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 20:13:49 by afontele          #+#    #+#             */
/*   Updated: 2025/07/10 10:41:49 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	write_heredoc_file(char *filename, char *delimiter, t_minishell *data)
{
	int		fd;
	char	*line;
	char	*expanded_line;

	fd = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if (fd == -1)
	{
		error_and_prompt_back(filename);
		free(filename);
		return (0);
	}
	signal(SIGINT, ft_handle_heredoc_signal);
	signal(SIGQUIT, SIG_IGN);
	while (1)
	{
		line = readline("> ");
		if (!line)
		{
			write(2, "bash: warning: here-document at line 1 delimited by end-of-file (wanted `", 73);
			write(2, delimiter, ft_strlen(delimiter));
			write(2, "')\n", 3);
			break ;
		}
		if (ft_strcmp(line, delimiter) == 0)
			break ;
		if (ft_check_dollars(line))
			expanded_line = ft_expend_d(line, 0, -1, data);
		else
		{
			expanded_line = ft_strdup(line);
			free(line);
		}
		if (expanded_line)
		{
			write(fd, expanded_line, ft_strlen(expanded_line));
			write(fd, "\n", 1);
			free(expanded_line);
		}
	}
	signal(SIGINT, SIG_DFL);
	signal(SIGQUIT, SIG_DFL);
	if (line)
		free(line);
	close(fd);
	return (1);
}

int	handle_heredoc(t_pars_cmd *cmd, int i, int *hd_count,
	t_minishell *data)
{
	char	*filename;

	filename = gen_heredoc_filename(*hd_count);
	if (!filename)
	{
		error_and_prompt_back("malloc heredoc filename");
		while (--i >= 0)
			free(cmd->heredoc[i]);
		free(cmd->heredoc);
		cmd->heredoc = NULL;
		return (0);
	}
	if (!write_heredoc_file(filename, cmd->delimiters[i], data))
	{
		free(filename);
		while (--i >= 0)
			free(cmd->heredoc[i]);
		free(cmd->heredoc);
		cmd->heredoc = NULL;
		return (0);
	}
	cmd->heredoc[i] = filename;
	(*hd_count)++;
	return (1);
}
