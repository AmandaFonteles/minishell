/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/09 12:51:18 by afontele          #+#    #+#             */
/*   Updated: 2025/04/25 11:06:13 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

#include "minishell.h"

// Helpers for memory and node creation
static t_pars_cmd *create_cmd_node(void)
{
    t_pars_cmd *cmd = malloc(sizeof(t_pars_cmd));
    if (!cmd)
        return NULL;
    cmd->cmd_index = 0;
    cmd->pid = 0;
    cmd->hd_nb = 0;
    cmd->heredoc = NULL;
    cmd->delimiters = NULL;
    cmd->infile = NULL;
    cmd->outfile = NULL;
    cmd->append = 0;
    cmd->args = NULL;
    cmd->next = NULL;
    return cmd;
}

// Splits the line into tokens and parses redirections/args
void basic_parse_input(t_minishell *data)
{
    char **tokens = ft_split(data->user_input, ' ');
    if (!tokens || !tokens[0])
        return;

    t_pars_cmd *cmd = create_cmd_node();
    if (!cmd)
        return;

    int i = 0, argc = 0, hd_count = 0;
    int token_count = strlen_array(tokens);
    cmd->args = malloc(sizeof(char *) * (token_count + 1));
    if (!cmd->args)
        return;

    // First pass to count heredocs
    while (tokens[i])
    {
        if (ft_strcmp(tokens[i], "<<") == 0 && tokens[i + 1])
            hd_count++;
        i++;
    }

    if (hd_count > 0)
    {
        cmd->delimiters = malloc(sizeof(char *) * (hd_count + 1));
        if (!cmd->delimiters)
            return;
        cmd->hd_nb = hd_count;
    }

    i = 0;
    int del_idx = 0;
    while (tokens[i])
    {
        if (ft_strcmp(tokens[i], "<") == 0 && tokens[i + 1])
            cmd->infile = ft_strdup(tokens[++i]);
        else if (ft_strcmp(tokens[i], ">") == 0 && tokens[i + 1])
        {
            cmd->outfile = ft_strdup(tokens[++i]);
            cmd->append = 0;
        }
        else if (ft_strcmp(tokens[i], ">>") == 0 && tokens[i + 1])
        {
            cmd->outfile = ft_strdup(tokens[++i]);
            cmd->append = 1;
        }
        else if (ft_strcmp(tokens[i], "<<") == 0 && tokens[i + 1])
        {
            cmd->delimiters[del_idx++] = ft_strdup(tokens[++i]);
        }
        else
            cmd->args[argc++] = ft_strdup(tokens[i]);
        i++;
    }
    cmd->args[argc] = NULL;
    if (cmd->delimiters)
        cmd->delimiters[del_idx] = NULL;

    data->cmd_list = cmd;
    data->cmd_nb = 1;

    free_arraystr(tokens);
}
