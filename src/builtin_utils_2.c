/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin_utils_2.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/09 14:33:49 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:35:29 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	is_valid_identifier(char *s)
{
	int	i;

	i = 1;
	if (!s || (!ft_isalpha(s[0]) && s[0] != '_'))
		return (0);
	while (s[i])
	{
		if (!ft_isalnum(s[i]) && s[i] != '_' && s[i] != '=')
			return (0);
		i++;
	}
	return (1);
}

void	remove_tenv(t_env **list, char *arg)
{
	t_env	*cur_env_node;
	t_env	*prev_env_node;

	cur_env_node = *list;
	prev_env_node = NULL;
	while (cur_env_node)
	{
		if (ft_strcmp(cur_env_node->title, arg) == 0)
		{
			if (prev_env_node)
				prev_env_node->next = cur_env_node->next;
			else
				*list = cur_env_node->next;
			if (cur_env_node->value)
				free(cur_env_node->value);
			free(cur_env_node->title);
			free(cur_env_node);
			return ;
		}
		prev_env_node = cur_env_node;
		cur_env_node = cur_env_node->next;
	}
}

int	strlen_array(char **arr)
{
	int	i;

	i = 0;
	while (arr && arr[i])
		i++;
	return (i);
}
