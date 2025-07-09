/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exit.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 15:02:33 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 15:02:54 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static int	too_many_args(char **args, int i)
{
	if (args[i] && args[i + 1])
	{
		g_exit_flag = 1;
		print_exit_error(NULL, "too many arguments");
		return (1);
	}
	return (0);
}

void	builtin_exit(t_minishell *data, t_pars_cmd *cmd)
{
	int			i;
	long long	arg;

	i = 1;
	if (cmd->args[1] == NULL)
	{
		free_to_exit(data);
		ft_putstr_fd("exit\n", 1);
		exit(0);
	}
	if (ft_strcmp(cmd->args[i], "--") == 0)
	{
		if (!cmd->args[i + 1])
		{
			free_to_exit(data);
			ft_putstr_fd("exit\n", 1);
			exit(0);
		}
		i++;
	}
	if (cmd->args[i] && !get_exit_code(cmd->args[i], &arg))
	{
		print_exit_error(cmd->args[i], "numeric argument required");
		free_to_exit(data);
		exit(2);
	}
	if (too_many_args(cmd->args, i))
		return ;
	ft_putstr_fd("exit\n", 1);
	free_to_exit(data);
	exit((unsigned char)arg);
}
