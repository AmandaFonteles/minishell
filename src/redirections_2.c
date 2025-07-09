/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections_2.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 22:52:06 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 22:57:48 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static int	get_infile_path(t_pars_cmd *cmd, char **infile, int *should_free)
{
	*should_free = 0;
	if (cmd->infile[0] == '"' || cmd->infile[0] == '\'')
	{
		*infile = ft_substr(cmd->infile, 1, ft_strlen(cmd->infile) - 2);
		if (!*infile)
			return (error_and_prompt_back(cmd->infile));
		*should_free = 1;
	}
	else
		*infile = cmd->infile;
	return (1);
}

static int	open_infile_fd(t_pars_cmd *cmd, char *infile,
		int should_free, int *fd_in)
{
	*fd_in = open(infile, O_RDONLY);
	if (should_free)
		free(infile);
	if (*fd_in == -1)
		return (error_and_prompt_back(cmd->infile));
	return (1);
}

static int	finalize_infile_dup(int fd_in, int should_dup)
{
	if (should_dup == 0)
	{
		close(fd_in);
		return (1);
	}
	if (!safe_dup2(fd_in, STDIN_FILENO))
	{
		close(fd_in);
		return (0);
	}
	close(fd_in);
	return (1);
}

int	open_infile(t_pars_cmd *cmd)
{
	int		fd_in;
	char	*infile;
	int		should_free;
	int		should_dup;

	should_dup = 1;
	if (!cmd->args || !cmd->args[0])
		should_dup = 0;
	if (!get_infile_path(cmd, &infile, &should_free))
		return (0);
	if (!open_infile_fd(cmd, infile, should_free, &fd_in))
		return (0);
	if (!finalize_infile_dup(fd_in, should_dup))
		return (0);
	return (1);
}
