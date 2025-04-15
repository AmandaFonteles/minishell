/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_management.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:45:20 by afontele          #+#    #+#             */
/*   Updated: 2025/04/07 16:47:47 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void    set_env(t_env *list, char *title, char *value)
{
    t_env *cur_node;

    cur_node = list;
    while (cur_node)
    {
        if (ft_strcmp(cur_node->title, title) == 0)
        {
            free(cur_node->value);
            cur_node->value = ft_strdup(value);
            return ;
        }
        cur_node = cur_node->next;
    }
}

char    *ft_getenv(char *directory_name, t_minishell *data)
{
    t_env *cur_env_node;

    cur_env_node = data->env;
    while (cur_env_node)
    {
        if (ft_strcmp(cur_env_node->title, directory_name) == 0)
            return (cur_env_node->value);
        cur_env_node = cur_env_node->next;
    }
    return (NULL);
}