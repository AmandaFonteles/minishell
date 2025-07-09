/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execve_hub_2.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 14:47:28 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:49:42 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

char	*safe_join(char *str, char *cmd)
{
	char	*tmp;
	char	*full_path;

	tmp = ft_strjoin(str, "/");
	if (!tmp)
		return (NULL);
	full_path = ft_strjoin(tmp, cmd);
	free(tmp);
	if (!full_path)
		return (NULL);
	return (full_path);
}

char	*exec_make_path(t_minishell *data, t_pars_cmd *cmd)
{
	char	*path;
	char	*cmd_path;

	path = ft_getenv("PATH", data);
	if (!path || !*path)
	{
		print_cmd_no_file(data, cmd->args[0]);
		free_to_exit(data);
		exit(g_exit_flag);
	}
	cmd_path = build_path(path, cmd->args[0]);
	if (!cmd_path)
	{
		print_cmd_not_found(data, cmd->args[0]);
		free_to_exit(data);
		exit(g_exit_flag);
	}
	return (cmd_path);
}

char	*build_path(char *path, char *cmd)
{
	char	*full_path;
	char	**possible_paths;
	int		i;

	i = 0;
	possible_paths = ft_split(path, ':');
	if (!possible_paths)
		error_and_prompt_back("error malloc");
	while (possible_paths[i])
	{
		full_path = safe_join(possible_paths[i], cmd);
		if (!full_path)
			return (free_arraystr(possible_paths), NULL);
		if (access(full_path, X_OK) == 0)
		{
			free_arraystr(possible_paths);
			return (full_path);
		}
		free(full_path);
		i++;
	}
	free_arraystr(possible_paths);
	return (NULL);
}

void	execve_error(t_minishell *data, char *cmd_path)
{
	if (errno == EACCES)
	{
		ft_putstr_fd("minishell: ", 2);
		ft_putstr_fd(data->cmd_list->args[0], 2);
		ft_putstr_fd(": Permission denied\n", 2);
		g_exit_flag = 126;
	}
	else if (errno == ENOENT)
	{
		print_cmd_not_found(data, data->cmd_list->args[0]);
		g_exit_flag = 127;
	}
	else
	{
		perror(data->cmd_list->args[0]);
		g_exit_flag = 1;
	}
	free(cmd_path);
	free_to_exit(data);
	exit(g_exit_flag);
}

int	check_full_path(char *cmd)
{
	return (ft_strchr(cmd, '/') != NULL);
}
