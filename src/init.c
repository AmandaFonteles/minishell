/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 18:03:09 by afontele          #+#    #+#             */
/*   Updated: 2025/04/09 18:29:55 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void    init_structs(t_minishell *data)
{
    data->user_input = NULL;
    data->cmd_list = NULL; //included in the parser (some parts will be included in the exec part)
    data->cmd_nb = 0; //included in the parser
    data->pipe_ends = NULL; //icluded in the pipe manager
}

void init_env(t_minishell *data, char **envp)
{
    int i;

    i = 0;
    data->env = NULL;
    data->envp = envp;
    while (envp[i])
    {
        add_env(data, envp[i]);
        i++;
    }
}

void init_exp(t_minishell *data, char **envp)
{
    int i;

    i = 0;
    data->exported = NULL;
    while (envp[i])
    {
        add_exp(data, envp[i]);
        i++;
    }
}

