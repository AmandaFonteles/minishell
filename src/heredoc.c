/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 20:13:49 by afontele          #+#    #+#             */
/*   Updated: 2025/07/10 10:53:59 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static void	print_eof_warning(char *delimiter)
{
	write(2,
		"bash: warning: here-document at line 1 "
		"delimited by end-of-file (wanted `",
		73);
	write(2, delimiter, ft_strlen(delimiter));
	write(2, "')\n", 3);
}

static void	write_line(int fd, char *line, t_minishell *data)
{
	char	*expanded;

	if (ft_check_dollars(line))
		expanded = ft_expend_d(line, 0, -1, data);
	else
	{
		expanded = ft_strdup(line);
		free(line);
	}
	if (expanded)
	{
		write(fd, expanded, ft_strlen(expanded));
		write(fd, "\n", 1);
		free(expanded);
	}
}

static void	heredoc_loop(int fd, char *delimiter, t_minishell *data)
{
	char	*line;

	while (1)
	{
		line = readline("> ");
		if (!line)
		{
			print_eof_warning(delimiter);
			break ;
		}
		if (ft_strcmp(line, delimiter) == 0)
			break ;
		write_line(fd, line, data);
	}
	if (line)
		free(line);
}

int	write_heredoc_file(char *filename, char *delimiter, t_minishell *data)
{
	int	fd;

	fd = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if (fd == -1)
	{
		error_and_prompt_back(filename);
		free(filename);
		return (0);
	}
	set_heredoc_signals();
	heredoc_loop(fd, delimiter, data);
	reset_heredoc_signals();
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
