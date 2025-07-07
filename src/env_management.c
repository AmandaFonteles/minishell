/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_management.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:45:20 by afontele          #+#    #+#             */
/*   Updated: 2025/07/07 13:24:21 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	g_exit_flag = 0;

char	*ft_getenv(char *variable, t_minishell *data)
{
	t_env	*cur_env_node;

	cur_env_node = data->env;
	while (cur_env_node)
	{
		if (ft_strcmp(cur_env_node->title, variable) == 0)
			return (cur_env_node->value);
		cur_env_node = cur_env_node->next;
	}
	return (NULL);
}

t_env	**get_adress(void)
{
	static t_env	*new = NULL;

	return (&new);
}

char	*white_get_env(char *name, t_minishell *data)
{
	t_env	*cur;

	cur = data->env;
	while (cur)
	{
		if (!ft_strcmp(cur->title, name))
			return (cur->value);
		cur = cur->next;
	}
	return (NULL);
}
