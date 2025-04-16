/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 20:13:49 by afontele          #+#    #+#             */
/*   Updated: 2025/04/16 20:31:44 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static char *gen_heredoc_filename(int index)
{
	char *num; 
	char *name;
	
	num = ft_itoa(index);
	if (!num)
		return NULL;
	name = ft_strjoin("hd_tmp", num);
	if (!name)
	{
		free(num);
		return NULL;
	}
	free(num);
	return (name);
}

void write_heredoc_file(t_minishell *data, char *filename, char *delimiter)
{
	int fd; 
	char *line;
	
	fd = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if (fd == -1)
	{
		error_and_prompt_back(data, filename);
		free(filename);
		return ;		
	}
	while (1)
	{
		line = readline("> ");
		if (!line || ft_strcmp(line, delimiter) == 0)
			break;
		write(fd, line, ft_strlen(line));
		write(fd, "\n", 1);
		free(line);
	}
	free(line);
	close(fd);
}

static void handle_heredoc(t_minishell *data, t_pars_cmd *cmd, int i, int *hd_count)
{
	char *filename;

	filename = gen_heredoc_filename(*hd_count);
	if (!filename)
		error_and_prompt_back(data, "malloc heredoc filename");
	write_heredoc_file(data, filename, cmd->delimiters[i]);
	cmd->heredoc[i] = filename;
	(*hd_count)++;
}

int generate_heredocs(t_minishell *data)
{
	t_pars_cmd *cmd;
	int hd_count;
	int i;

	hd_count = 0;
	cmd = data->cmd_list;
	while (cmd)
	{
		if (cmd->delimiters)
		{
			cmd->heredoc = malloc(sizeof(char *) * (cmd->hd_nb + 1));
			if (!cmd->heredoc)			
				return (error_and_prompt_back(data, "malloc heredoc"), 0);
			i = 0;
			while (i < cmd->hd_nb)
			{
				handle_heredoc(data, cmd, i, &hd_count);
				i++;
			}
			cmd->heredoc[cmd->hd_nb] = NULL;
		}
		cmd = cmd->next;
	}
	return (1);
}

char *last_heredoc_path(t_pars_cmd *cmd)
{
	int i = 0;
	if (!cmd->heredoc)
		return NULL;
	while (cmd->heredoc[i + 1])
		i++;
	return (cmd->heredoc[i]);
}

int redirect_heredoc(t_minishell *data, t_pars_cmd *cmd)
{
	char *path;
	int fd_hd;
	
	path = last_heredoc_path(cmd);
	if (!path)
    	return (error_and_prompt_back(data, "heredoc: path not found\n"));
	fd_hd = open(path, O_RDONLY);
	if (fd_hd == -1)
		return (error_and_prompt_back(data, path));
	if (safe_dup2(fd_hd, STDIN_FILENO, data) == 0)
		return (0);
	close(fd_hd);
	return (1);
}
