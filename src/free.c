/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 16:24:55 by afontele          #+#    #+#             */
/*   Updated: 2025/05/20 12:30:47 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void    free_pipes(t_minishell *data)
{
    int i;

    i = 0;
    if (data->pipe_ends == NULL)
        return ;
    while (i < data->cmd_nb - 1)
    {
		/*if (data->pipe_ends[i])
		{
			close(data->pipe_ends[i][0]);
			close(data->pipe_ends[i][1]);
		}*/
        free(data->pipe_ends[i]);
        i++;
    }
    free(data->pipe_ends);
	data->pipe_ends = NULL;
}

void free_arraystr(char **arr)
{
    int i = 0;
    while (arr && arr[i])
        free(arr[i++]);
    free(arr);
}

void cleanup_heredocs(t_minishell *data)
{
	t_pars_cmd *cmd = data->cmd_list;
	int i;

	while (cmd)
	{
		if (cmd->heredoc)
		{
			i = 0;
			while (cmd->heredoc[i])
			{
				unlink(cmd->heredoc[i]);
				free(cmd->heredoc[i]);
				cmd->heredoc[i] = NULL;
				i++;
			}
			free(cmd->heredoc);
			cmd->heredoc = NULL;
		}
		cmd = cmd->next;
	}
}

void	free_cmd_node(t_pars_cmd *cmd)
{
	t_pars_cmd *temp;

	while (cmd)
	{
		temp = cmd->next;
		if (cmd->delimiters)
			free_arraystr(cmd->delimiters);
		if (cmd->infile)
			free(cmd->infile);
		if (cmd->outfile)
			free(cmd->outfile);
		if (cmd->args)
			free_arraystr(cmd->args);
		if (cmd->heredoc)
			free_arraystr(cmd->heredoc);
		free(cmd);
		cmd = temp;
	}
}

// void	free_all(t_minishell *data)
// {
// 	if (data->cmd_list)
// 	{
// 		cleanup_heredocs(data);
// 		free_cmd_node(data->cmd_list);
// 	}
// 	if (data->user_input)
// 		free(data->user_input);
// 	if (data->pipe_ends)
// 		free_pipes(data);
// }

void free_all(t_minishell *data)
{
    if (data->cmd_list)
    {
        cleanup_heredocs(data);
        t_pars_cmd *cur = data->cmd_list;
        while (cur)
        {
            if (cur->token)
                free_token_list(cur->token);
            cur = cur->next;
        }
        free_cmd_node(data->cmd_list);
        data->cmd_list = NULL;
    }
    if (data->user_input)
    {
        free(data->user_input);
        data->user_input = NULL;
    }
    if (data->pipe_ends)
    {
        free_pipes(data);
        data->pipe_ends = NULL;
    }
}

void free_to_exit(t_minishell *data)
{
	if (data)
	{
		free_all(data);
		if (data->env)
			free_env(data->env);
		if (data->exported)
			free_env(data->exported);
		free(data);
		data = NULL;
	}
}

void free_env(t_env *list)
{
	t_env *temp;

	while (list)
	{
		temp = list;
		list = list->next;
		if (temp->title)
			free(temp->title);
		if (temp->value)
			free(temp->value);
		free(temp);
	}
}

void free_token_list(t_token **token)
{
    t_token *cur;
    t_token *next;

    if (!token || !*token)
        return;
    cur = *token;
    while (cur)
    {
        next = cur->next;
        if (cur->word)
            free(cur->word);
        free(cur);
        cur = next;
    }
    free(token);
}
