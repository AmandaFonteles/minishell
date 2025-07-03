/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 20:13:49 by afontele          #+#    #+#             */
/*   Updated: 2025/07/03 14:28:48 by adregis          ###   ########.fr       */
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

int write_heredoc_file(char *filename, char *delimiter, t_minishell *data)
{
	int fd;
	char *line;
	char *expanded_line;
	int original_exit_flag;

	fd = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if (fd == -1)
	{
		error_and_prompt_back(filename);
		free(filename);
		return (0);
	}

	// Sauvegarder l'ancien exit flag
	original_exit_flag = global_exit_flag;
	global_exit_flag = 0;

	// Configurer les signaux pour l'heredoc
	signal(SIGINT, ft_handle_heredoc_signal);
	signal(SIGQUIT, SIG_IGN);

	while (1)
	{
		line = readline("> ");

		// Vérifier si on a reçu un signal (Ctrl+C)
		if (global_exit_flag == 130)
		{
			free(line);
			close(fd);
			unlink(filename); // Supprimer le fichier
			signal(SIGINT, SIG_DFL);
			signal(SIGQUIT, SIG_DFL);
			global_exit_flag = original_exit_flag;
			return (0);
		}

		// Ctrl+D (EOF) ou délimiteur trouvé
		if (!line || ft_strcmp(line, delimiter) == 0)
		{
			free(line);
			break;
		}

		if (ft_check_dollars(line))
		{
			expanded_line = ft_expend_d(line, 0, -1, data);
		}
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

	// Restaurer les signaux
	signal(SIGINT, SIG_DFL);
	signal(SIGQUIT, SIG_DFL);
	global_exit_flag = original_exit_flag;

	close(fd);
	return (1);
}

static int handle_heredoc(t_pars_cmd *cmd, int i, int *hd_count, t_minishell *data)
{
	char *filename;

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
				return (error_and_prompt_back("malloc heredoc"), 0);
			i = 0;
			while (i < cmd->hd_nb)
			{
				if (!handle_heredoc(cmd, i, &hd_count, data))
				{
					// Si on a été interrompu par Ctrl+C, arrêter complètement
					if (global_exit_flag == 130)
						return (0);
					// Sinon, c'est une erreur normale, continuer
					i++;
					continue;
				}
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

int redirect_heredoc(t_pars_cmd *cmd)
{
	char *path;
	int fd_hd;

	path = last_heredoc_path(cmd);
	if (!path)
		return (error_and_prompt_back("heredoc: path not found\n"));
	fd_hd = open(path, O_RDONLY);
	if (fd_hd == -1)
		return (error_and_prompt_back(path));
	if (safe_dup2(fd_hd, STDIN_FILENO) == 0)
		return (0);
	close(fd_hd);
	return (1);
}
