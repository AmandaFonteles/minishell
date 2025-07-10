/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_exp.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/09 00:17:20 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 21:09:59 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	builtin_export(t_minishell *data, t_pars_cmd *cmd)
{
	int	i;

	i = 1;
	g_exit_flag = 0;
	if (!cmd->args[i]
		|| (ft_strcmp(cmd->args[i], "--") == 0 && !cmd->args[i + 1]))
	{
		print_exported(data->exported);
		return ;
	}
	if (ft_strcmp(cmd->args[i], "--") == 0 && cmd->args[i + 1])
		i++;
	if (ft_strncmp(cmd->args[i], "-", 1) == 0 && cmd->args[i][1] != '\0')
	{
		print_invalid_option(cmd->args[0], cmd->args[i]);
		return ;
	}
	while (cmd->args[i])
	{
		check_exp(data, cmd->args[i]);
		i++;
	}
}

void	print_exported(t_env *cur_exp_node)
{
	while (cur_exp_node)
	{
		if (cur_exp_node->title)
		{
			ft_putstr_fd("export ", 1);
			ft_putstr_fd(cur_exp_node->title, 1);
			if (cur_exp_node->value)
			{
				ft_putstr_fd("=\"", 1);
				ft_putstr_fd(cur_exp_node->value, 1);
				ft_putstr_fd("\"", 1);
			}
			ft_putstr_fd("\n", 1);
		}
		cur_exp_node = cur_exp_node->next;
	}
}

static int	parse_export_arg(t_exp_data *exp)
{
	exp->has_equal = 0;
	if (!extract_key_value(exp->arg, &exp->key, &exp->value))
	{
		error_and_prompt_back("malloc");
		return (0);
	}
	if (!is_valid_identifier(exp->key))
	{
		print_invalid_identifier("export", exp->arg);
		free(exp->key);
		free(exp->value);
		return (0);
	}
	if (ft_strchr(exp->arg, '='))
		exp->has_equal = 1;
	return (1);
}

static void	update_export_lists(t_minishell *data, t_exp_data *exp)
{
	if (update_env_value_in_list(data->exported, exp->key, exp->value))
	{
		if (exp->has_equal)
			check_env(data, exp->arg);
	}
	else
	{
		if (exp->has_equal)
			add_env(data, exp->arg, &data->env);
		add_env(data, exp->arg, &data->exported);
	}
}

void	export_or_update(t_minishell *data, char *arg)
{
	t_exp_data	exp;

	exp.arg = arg;
	if (!parse_export_arg(&exp))
		return ;
	update_export_lists(data, &exp);
	free(exp.key);
	free(exp.value);
}
