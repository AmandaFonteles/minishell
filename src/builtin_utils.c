/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/18 18:18:08 by afontele          #+#    #+#             */
/*   Updated: 2025/07/02 21:01:41 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

//exit utils
int isnbr(char *str)
{
    int i;

    i = 0;
    if (!str || !str[0])
        return (0);
    if (str[i] == '-' || str[i] == '+')
        i++;
    if (str[i] == '\0')
        return (0);
    while (str[i])
    {
        if (str[i] < '0' || str[i] > '9')
            return (0);
        i++;
    }
    return (1);
}

static int get_sig(const char **str)
{
    int sig;

    sig = 1;
    if (**str == '-')
    {
        sig = -1;
        (*str)++;
    }
    else if (**str == '+')
        (*str)++;
    return (sig);
}

static long long get_overflow(int sig, int *overflow)
{
    *overflow = 1;
    if (sig == 1)
        return (LLONG_MAX);
    return (LLONG_MIN);
}

long long modif_atoll(const char *str, int *overflow)
{
    unsigned long long resul;
    unsigned long long limit;
    int sig;
    unsigned int j;

    resul = 0;
    sig = get_sig(&str);
    *overflow = 0;
    if (sig == 1)
        limit = LLONG_MAX;
    else
        limit = (unsigned long long)LLONG_MAX + 1;
    while (*str && *str >= '0' && *str <= '9')
    {
        j = *str - '0';
        if (resul > limit / 10 || (resul == limit / 10 && j > limit % 10))
            return (get_overflow(sig, overflow));
        resul = resul * 10 + j;
        str++;
    }
    if (sig == 1)
        return ((long long)resul);
    return ((long long)(-resul));
}

int get_exit_code(char *str, long long *value)
{
    int overflow;

    if (!isnbr(str))
        return (0);
    *value = modif_atoll(str, &overflow);
    if (overflow)
        return (0);
    //if (*value < 0 || *value > 255)
      //  *value = *value % 256;
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

void    remove_tenv(t_env **list, char *arg)
{
    t_env *cur_env_node;
    t_env *prev_env_node;

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

int strlen_array(char **arr)
{
    int i;

    i = 0;
    while (arr && arr[i])
        i++;
    return (i);
}
