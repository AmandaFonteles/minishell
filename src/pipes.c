/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipes.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 15:31:05 by afontele          #+#    #+#             */
/*   Updated: 2025/06/20 17:18:43 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int    create_pipes(t_minishell *data)
{
    int i;

    i = 0;
    while (i < data->cmd_nb - 1)
    {
        if (pipe(data->pipe_ends[i]) == -1)
        {
            close_all_pipes(data); //check if this is needed
            error_and_prompt_back("error creating pipe"); // Error creating pipe
            return (0);
        }
        i++;
    }
    return (1);
}

void    close_unused_pipes(t_minishell *data, t_pars_cmd *cur_cmd)
{
    int i;

    i = 0;
    if (data->cmd_nb <= 1)
        return ;
    while (i < data->cmd_nb - 1)
    {
        if (i != cur_cmd->cmd_index - 1 && data->pipe_ends[i][0] != -1)
        {
            close(data->pipe_ends[i][0]);
            data->pipe_ends[i][0] = -1; // Mark as closed
        }   
        if (i != cur_cmd->cmd_index && data->pipe_ends[i][1] != -1)
        {
            close(data->pipe_ends[i][1]);
            data->pipe_ends[i][1] = -1; // Mark as closed
        }
        i++;
    }
}

void    close_all_pipes(t_minishell *data)
{
    int i;

    i = 0;
    if (data->cmd_nb <= 1 || !data->pipe_ends)
        return ;
    while (i < data->cmd_nb - 1)
    {
        if (data->pipe_ends[i])
        {
            if (data->pipe_ends[i][0] != -1)
            {
                close(data->pipe_ends[i][0]);
                data->pipe_ends[i][0] = -1; // Mark as closed
            }
            if (data->pipe_ends[i][1] != -1)
            {
                close(data->pipe_ends[i][1]);
                data->pipe_ends[i][1] = -1; // Mark as closed
            }
        }
        i++;
    }
}