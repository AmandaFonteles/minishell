/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_exp.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/09 00:17:20 by afontele          #+#    #+#             */
/*   Updated: 2025/05/29 20:18:09 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void builtin_env(t_minishell *data, t_pars_cmd *cmd)
{
    t_env *cur_env_node;
    
    cur_env_node = data->env;
    global_exit_flag = 0;
    if (!cur_env_node)
    {
        global_exit_flag = 1;
        return ;
    }
    if (cmd->args[1])
    {
        ft_putstr_fd("minishell: env: doesn't accept arguments\n", 2);
        global_exit_flag = 1;
        return ;
    }
    while (cur_env_node)
    {
        if (cur_env_node->value)
            printf("%s=%s\n", cur_env_node->title, cur_env_node->value);
        cur_env_node = cur_env_node->next;
    }  
}

void builtin_export(t_minishell *data, t_pars_cmd *cmd)
{
    int i;

    i = 1;
    global_exit_flag = 0;
    if (!cmd->args[i] || (ft_strcmp(cmd->args[i], "--") == 0 && !cmd->args[i + 1]))
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

//learn how to put quotes in the value
void print_exported(t_env *cur_exp_node)
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

int extract_key_value(char *arg, char **key, char **value)
{
	char *equal;

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

int update_env_value_in_list(t_env *list, char *key, char *value)
{
	t_env *cur;

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

void export_or_update(t_minishell *data, char *arg)
{
    char *key;
    char *value;
    int has_equal;

    has_equal = 0;
    if (!extract_key_value(arg, &key, &value))
    {
        error_and_prompt_back("malloc");
        return ;
    }
    if (ft_strchr(arg, '='))
        has_equal = 1;
    if (update_env_value_in_list(data->exported, key, value))
    {
        if (has_equal)
            check_env(data, arg);
    }
    else
    {
        if (has_equal)
            add_env(data, arg, &data->env);
        add_env(data, arg, &data->exported);
    }
    free(key);
    free(value);
}

void check_exp(t_minishell *data, char *arg)
{
	if (!is_valid_identifier(arg))
	{
		print_invalid_identifier(arg);
		return ;
	}
	export_or_update(data, arg);
}

void check_env(t_minishell *data, char *arg)
{
	char *key;
	char *value;

	if (!extract_key_value(arg, &key, &value))
	{
		error_and_prompt_back("malloc");
		return ;
	}
	if (!update_env_value_in_list(data->env, key, value))
		add_env(data, arg, &data->env);
	free(key);
	free(value);
}
