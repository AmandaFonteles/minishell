/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execve_hub.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/31 10:59:29 by afontele          #+#    #+#             */
/*   Updated: 2025/07/07 13:37:48 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"
#include <dirent.h>
#include <sys/stat.h>

void	execute(t_minishell *data, t_pars_cmd *cur_cmd)
{
	if (!cur_cmd->args || !cur_cmd->args[0])
	{
		print_cmd_not_found(data, NULL);
		free_to_exit(data);
		exit(g_exit_flag);
	}
	if (is_builtin(cur_cmd))
	{
		builtin_hub(data, cur_cmd);
		return ;
	}
	else
	{
		resolve_and_exec(data, cur_cmd);
		return ;
	}
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

void	resolve_and_exec(t_minishell *data, t_pars_cmd *cmd)
{
	char			*cmd_path;
	struct stat		path_stat;

	if (!check_full_path(cmd->args[0]))
		cmd_path = exec_make_path(data, cmd);
	else
	{
		cmd_path = ft_strdup(cmd->args[0]);
		if (!cmd_path)
		{
			error_and_prompt_back("malloc error");
			return ;
		}
		if (stat(cmd_path, &path_stat) == -1)
		{
			print_cmd_not_found(data, cmd->args[0]);
			free(cmd_path);
			free_to_exit(data);
			exit(g_exit_flag);
		}
		if (S_ISDIR(path_stat.st_mode))
		{
			ft_putstr_fd("minishell: ", 2);
			ft_putstr_fd(cmd->args[0], 2);
			ft_putstr_fd(": is a directory\n", 2);
			free(cmd_path);
			free_to_exit(data);
			exit(126);
		}
		if (access(cmd_path, X_OK) == -1)
		{
			ft_putstr_fd("minishell: ", 2);
			ft_putstr_fd(cmd->args[0], 2);
			ft_putstr_fd(": Permission denied\n", 2);
			free(cmd_path);
			free_to_exit(data);
			exit(126);
		}
	}
	if (execve(cmd_path, cmd->args, data->envp) == -1)
	{
		execve_error(data, cmd_path);
		return ;
	}
	free(cmd_path);
}

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
