/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/18 18:18:08 by afontele          #+#    #+#             */
/*   Updated: 2025/04/09 18:46:07 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

//exit utils
int isnbr(char *str)
{
    int i;

    i = 0;
    if (str[i] == '-' || str[i] == '+')
        i++;
    while (str[i])
    {
        if (str[i] < '0' || str[i] > '9')
            return (0);
        i++;
    }
    long long nb = ft_atoll(str);
    if (nb > LLONG_MAX || nb < LLONG_MIN)
        return (0);
    return (1);
}

//should be handled in parse
int is_valid_identifier(char *s)
{
    int i;

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

void    remove_tenv(t_env *list, char *arg)
{
    t_env *cur_env_node;
    t_env *prev_env_node;

    cur_env_node = list;
    prev_env_node = NULL;
    while (cur_env_node)
    {
        if (ft_strcmp(cur_env_node->title, arg) == 0)
        {
            if (prev_env_node)
                prev_env_node->next = cur_env_node->next;
            else
                list = cur_env_node->next;
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