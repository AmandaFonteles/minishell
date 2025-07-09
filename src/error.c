/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/31 12:08:03 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 13:09:04 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	error_to_exit(t_minishell *data, char *msg)
{
	(void)data;
	ft_putstr_fd("minishell: ", 2);
	if (msg)
		perror(msg);
	free_to_exit(data);
	exit(1);
}

int	error_and_prompt_back(char *msg)
{
	ft_putstr_fd("minishell: ", 2);
	if (msg)
		perror(msg);
	g_exit_flag = 1;
	return (0);
}

int	safe_dup2(int oldfd, int newfd)
{
	if (dup2(oldfd, newfd) == -1)
	{
		ft_putstr_fd("minishell: ", 2);
		perror("dup2");
		close(oldfd);
		g_exit_flag = 1;
		return (0);
	}
	return (1);
}

void	print_cmd_not_found(t_minishell *data, char *cmd)
{
	if (check_full_path(cmd))
	{
		ft_putstr_fd("minishell: ", 2);
		ft_putstr_fd(cmd, 2);
		ft_putstr_fd(": No such file or directory\n", 2);
	}
	else
	{
		ft_putstr_fd("minishell: ", 2);
		if (cmd)
			ft_putstr_fd(cmd, 2);
		else if (data->cmd_list && data->cmd_list->args
			&& data->cmd_list->args[0])
			ft_putstr_fd(data->cmd_list->args[0], 2);
		ft_putstr_fd(": command not found\n", 2);
	}
	g_exit_flag = 127;
}

void	print_cmd_no_file(t_minishell *data, char *cmd)
{
	ft_putstr_fd("minishell: ", 2);
	if (cmd)
		ft_putstr_fd(cmd, 2);
	else if (data->cmd_list && data->cmd_list->args
		&& data->cmd_list->args[0])
		ft_putstr_fd(data->cmd_list->args[0], 2);
	ft_putstr_fd(": No such file or directory\n", 2);
	g_exit_flag = 127;
}
