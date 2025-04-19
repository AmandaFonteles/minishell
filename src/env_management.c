/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env_management.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:45:20 by afontele          #+#    #+#             */
/*   Updated: 2025/04/19 21:39:53 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

char    *ft_getenv(char *variable, t_minishell *data)
{
    t_env *cur_env_node;

    cur_env_node = data->env;
    while (cur_env_node)
    {
        if (ft_strcmp(cur_env_node->title, variable) == 0)
            return (cur_env_node->value);
        cur_env_node = cur_env_node->next;
    }
    return (NULL);
}