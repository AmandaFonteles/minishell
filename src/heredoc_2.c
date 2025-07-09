/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   heredoc_2.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 14:56:13 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:58:56 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	generate_heredocs(t_minishell *data)
{
	t_pars_cmd	*cmd;
	int			hd_count;
	int			i;

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
					return (0);
				i++;
			}
			cmd->heredoc[cmd->hd_nb] = NULL;
		}
		cmd = cmd->next;
	}
	return (1);
}

int	redirect_heredoc(t_pars_cmd *cmd)
{
	char	*path;
	int		fd_hd;

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

char	*last_heredoc_path(t_pars_cmd *cmd)
{
	int	i;

	i = 0;
	if (!cmd->heredoc)
		return (NULL);
	while (cmd->heredoc[i + 1])
		i++;
	return (cmd->heredoc[i]);
}

char	*gen_heredoc_filename(int index)
{
	char	*num;
	char	*name;

	num = ft_itoa(index);
	if (!num)
		return (NULL);
	name = ft_strjoin("hd_tmp", num);
	if (!name)
	{
		free(num);
		return (NULL);
	}
	free(num);
	return (name);
}
