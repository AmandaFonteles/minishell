/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtins.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/11 14:47:11 by afontele          #+#    #+#             */
/*   Updated: 2025/07/01 14:19:17 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	is_builtin(t_pars_cmd *command)
{
	if (!command || !command->args || !command->args[0])
		return (0);
	if ((ft_strcmp(command->args[0], "echo") == 0)
		|| (ft_strcmp(command->args[0], "cd") == 0)
		|| (ft_strcmp(command->args[0], "pwd") == 0)
		|| (ft_strcmp(command->args[0], "export") == 0)
		|| (ft_strcmp(command->args[0], "unset") == 0)
		|| (ft_strcmp(command->args[0], "env") == 0)
		|| (ft_strcmp(command->args[0], "exit") == 0))
		return (1);
	else
		return (0);
}

void	single_builtin(t_minishell *data, t_pars_cmd *cmd)
{
	int	fd_in;
	int	fd_out;

	fd_in = dup(STDIN_FILENO);
	fd_out = dup(STDOUT_FILENO);
	if (fd_in == -1 || fd_out == -1)
	{
		error_and_prompt_back("dup");
		return ;
	}
	if (!setup_redirections(cmd))
	{
		if (dup_and_close(fd_in, fd_out) == 0)
			return ;
	}
	if (cmd && cmd->args && cmd->args[0]
		&& ft_strcmp(cmd->args[0], "exit") == 0)
	{
		dup_and_close(fd_in, fd_out);
		builtin_exit(data, cmd);
		return ;
	}
	builtin_hub(data, cmd);
	if (dup_and_close(fd_in, fd_out) == 0)
		return ;
}

int	dup_and_close(int fd_in, int fd_out)
{
	int	i;

	i = 1;
	if (!safe_dup2(fd_in, STDIN_FILENO))
		i = 0;
	if (!safe_dup2(fd_out, STDOUT_FILENO))
		i = 0;
	close(fd_in);
	close(fd_out);
	return (i);
}

void	builtin_hub(t_minishell *data, t_pars_cmd *cmd)
{
	if (!cmd || !cmd->args || !cmd->args[0])
		return ;
	if (ft_strcmp(cmd->args[0], "echo") == 0)
		builtin_echo(cmd);
	else if (ft_strcmp(cmd->args[0], "cd") == 0)
		builtin_cd(data, cmd);
	else if (ft_strcmp(cmd->args[0], "pwd") == 0)
		builtin_pwd(cmd);
	else if (ft_strcmp(cmd->args[0], "export") == 0)
		builtin_export(data, cmd);
	else if (ft_strcmp(cmd->args[0], "unset") == 0)
		builtin_unset(data, cmd);
	else if (ft_strcmp(cmd->args[0], "env") == 0)
		builtin_env(data, cmd);
	else if (ft_strcmp(cmd->args[0], "exit") == 0)
		builtin_exit(data, cmd);
}
