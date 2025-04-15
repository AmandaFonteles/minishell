/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 18:03:09 by afontele          #+#    #+#             */
/*   Updated: 2025/04/15 15:58:14 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int init_data(t_minishell *data, char **envp)
{
    init_structs(data);
    data->envp = envp;
    if (!init_envp(data))        
        return (0);
    return (1);
}

void    init_structs(t_minishell *data)
{
    data->user_input = NULL;
    data->cmd_list = NULL; //included in the parser (some parts will be included in the exec part)
    data->cmd_nb = 0; //included in the parser
    data->pipe_ends = NULL; //icluded in the pipe manager
}

int init_envp(t_minishell *data)
{
    int i;

    i = 0;
    data->env = NULL;
    data->exported = NULL;
    while (data->envp[i])
    {
        if (!add_env(data, data->envp[i]))
            return (0);
        if (!add_exp(data, data->envp[i]))
            return (0);
        i++;
    }
    return (1);
}

t_env   *create_env_node(t_minishell *data, char *env_str)
{
	t_env	*new;
	char	*equal;

	new = malloc(sizeof(t_env));
	if (!new)
		error_init(data, "malloc t_env node");
	equal = ft_strchr(env_str, '=');
	if (equal)
	{
		if (!(new->title = ft_substr(env_str, 0, equal - env_str))
        || !(new->value = ft_strdup(equal + 1)))
        {
			error_init(data, "error populating env node");
            return (NULL);           
        }
	}
    else
    {
        if (!(new->title = ft_strdup(env_str)))
            error_init(data, "error ft_strdup");
        new->value = NULL;
    }
    new->next = NULL;
    return (new);
}

int add_env(t_minishell *data, char *env)
{
    t_env *new;
    t_env *cur;

    new = create_env_node(data, env);
    if (!new)
        return (0);
    if (!data->env)
    {
        data->env = new;
        return (1);
    }
    cur = data->env;
    while (cur->next)
        cur = cur->next;
    cur->next = new;
    return (1);
}

int add_exp(t_minishell *data, char *envp)
{
    t_env *new;
    t_env *cur;

    new = create_env_node(data, envp);
    if (!new)
        return (0);
    if (!data->exported)
    {
        data->exported = new;
        return (1);
    }
    cur = data->exported;
    while (cur->next)
        cur = cur->next;
    cur->next = new;
    return (1);
}