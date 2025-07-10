/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 18:03:09 by afontele          #+#    #+#             */
/*   Updated: 2025/07/10 11:05:55 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	append_env_node(t_env **parse_env, t_env *new)
{
	t_env	*cur;

	if (!(*parse_env))
		*parse_env = new;
	else
	{
		cur = *parse_env;
		while (cur->next)
			cur = cur->next;
		cur->next = new;
	}
	return (1);
}

int	init_data(t_minishell *data, char **envp)
{
	t_env	**parse_env;
	t_env	*new;
	int		i;

	init_structs(data);
	data->envp = envp;
	if (!init_envp(data))
		return (0);
	parse_env = get_adress();
	i = 0;
	while (envp[i])
	{
		new = create_env_node(data, envp[i]);
		if (!new)
			return (0);
		if (!append_env_node(parse_env, new))
			return (0);
		i++;
	}
	return (1);
}

void	init_structs(t_minishell *data)
{
	data->user_input = NULL;
	data->cmd_list = NULL;
	data->cmd_nb = 0;
	data->pipe_ends = NULL;
}

int	init_envp(t_minishell *data)
{
	int	i;

	i = 0;
	data->env = NULL;
	data->exported = NULL;
	while (data->envp[i])
	{
		if (!add_env(data, data->envp[i], &data->env))
			return (0);
		if (!add_env(data, data->envp[i], &data->exported))
			return (0);
		i++;
	}
	return (1);
}
