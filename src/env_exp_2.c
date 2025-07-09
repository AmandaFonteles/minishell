/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_exp_2.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 14:39:33 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 19:06:51 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	check_env(t_minishell *data, char *arg)
{
	char	*key;
	char	*value;

	if (!extract_key_value(arg, &key, &value))
	{
		error_and_prompt_back("malloc");
		return ;
	}
	if (!is_valid_identifier(key))
	{
		print_invalid_identifier("export", arg);
		free(key);
		free(value);
		return ;
	}
	if (!update_env_value_in_list(data->env, key, value))
		add_env(data, arg, &data->env);
	free(key);
	free(value);
}

int	update_env_value_in_list(t_env *list, char *key, char *value)
{
	t_env	*cur;

	cur = list;
	while (cur)
	{
		if (ft_strcmp(cur->title, key) == 0)
		{
			if (cur->value)
				free(cur->value);
			cur->value = ft_strdup(value);
			if (!cur->value)
				return (0);
			return (1);
		}
		cur = cur->next;
	}
	return (0);
}

int	extract_key_value(char *arg, char **key, char **value)
{
	char	*equal;

	equal = ft_strchr(arg, '=');
	if (equal)
	{
		*key = ft_substr(arg, 0, equal - arg);
		if (!(*key))
			return (0);
		*value = ft_strdup(equal + 1);
		if (!(*value))
		{
			free(*key);
			return (0);
		}
	}
	else
	{
		*key = ft_strdup(arg);
		if (!(*key))
			return (0);
		*value = NULL;
	}
	return (1);
}

void	builtin_env(t_minishell *data, t_pars_cmd *cmd)
{
	t_env	*cur_env_node;

	cur_env_node = data->env;
	g_exit_flag = 0;
	if (!ft_getenv("PATH", data))
	{
		ft_putstr_fd("minishell: env: No such file or directory\n", 2);
		g_exit_flag = 127;
		return ;
	}
	if (cmd->args[1])
	{
		ft_putstr_fd("minishell: env: doesn't accept arguments\n", 2);
		g_exit_flag = 1;
		return ;
	}
	while (cur_env_node)
	{
		if (cur_env_node->value)
			printf("%s=%s\n", cur_env_node->title, cur_env_node->value);
		cur_env_node = cur_env_node->next;
	}
}

void	check_exp(t_minishell *data, char *arg)
{
	if (!is_valid_identifier(arg))
	{
		print_invalid_identifier("export", arg);
		return ;
	}
	export_or_update(data, arg);
}
