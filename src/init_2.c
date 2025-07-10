/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_2.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/10 11:00:14 by adregis           #+#    #+#             */
/*   Updated: 2025/07/10 11:07:38 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	add_env(t_minishell *data, char *envp, t_env **list)
{
	t_env	*new;
	t_env	*cur;

	new = create_env_node(data, envp);
	if (!new)
		return (0);
	if (!(*list))
	{
		*list = new;
		return (1);
	}
	cur = *list;
	while (cur->next)
		cur = cur->next;
	cur->next = new;
	return (1);
}

void	fill_env_node(t_minishell *data, t_env *new, char *env_str)
{
	char	*equal;

	equal = ft_strchr(env_str, '=');
	if (equal)
	{
		new->title = ft_substr(env_str, 0, equal - env_str);
		new->value = ft_strdup(equal + 1);
		if (!new->title || !new->value)
			error_to_exit(data, "error populating env node");
	}
	else
	{
		new->title = ft_strdup(env_str);
		if (!new->title)
			error_to_exit(data, "error ft_strdup");
		new->value = NULL;
	}
}

t_env	*create_env_node(t_minishell *data, char *env_str)
{
	t_env	*new;

	new = malloc(sizeof(t_env));
	if (!new)
		error_to_exit(data, "malloc t_env node");
	fill_env_node(data, new, env_str);
	new->next = NULL;
	return (new);
}
