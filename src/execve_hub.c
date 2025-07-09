/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execve_hub.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/31 10:59:29 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:49:16 by afontele         ###   ########.fr       */
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
