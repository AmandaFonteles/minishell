/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exit.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 15:02:33 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 21:34:11 by afontele         ###   ########.fr       */
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

static void	exit_program(t_minishell *data, int status)
{
	ft_putstr_fd("exit\n", 1);
	free_to_exit(data);
	exit(status);
}

static void	check_no_arg(t_minishell *data, char **args, int *i)
{
	if (args[*i] == NULL)
		exit_program(data, 0);
	if (ft_strcmp(args[*i], "--") == 0)
	{
		if (!args[*i + 1])
			exit_program(data, 0);
		(*i)++;
	}
}

static void	parse_exit_arg(t_minishell *data, char *arg_str, long long *arg)
{
	if (arg_str && !get_exit_code(arg_str, arg))
	{
		print_exit_error(arg_str, "numeric argument required");
		exit_program(data, 2);
	}
}

void	builtin_exit(t_minishell *data, t_pars_cmd *cmd)
{
	int			i;
	long long	arg;

	i = 1;
	check_no_arg(data, cmd->args, &i);
	parse_exit_arg(data, cmd->args[i], &arg);
	if (too_many_args(cmd->args, i))
		return ;
	exit_program(data, (unsigned char)arg);
}
