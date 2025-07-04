/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:56:58 by afontele          #+#    #+#             */
/*   Updated: 2025/07/03 12:40:41 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int setup_redirections(t_pars_cmd *cmd)
{
    t_token *cur = *(cmd->token);
    int last_fd = -1;
    char *filename = NULL;
    int append = 0;

    if (cmd->infile)
    {
        if (!open_infile(cmd))
            return 0;
    }
    else if (cmd->heredoc && cmd->heredoc[0])
        if (!redirect_heredoc(cmd))
            return 0;

    if (cmd->token && *(cmd->token))
    {
        while (cur)
        {
            if ((cur->type == FILE_OUT || cur->type == FILE_OUT_SUR) && cur->next && cur->next->word)
            {
                if (filename)
                    free(filename);
                filename = ft_strdup(cur->next->word);
                if (!filename)
                    return 0;
                append = (cur->type == FILE_OUT_SUR);
                if (last_fd != -1)
                    close(last_fd);
                if (append)
                    last_fd = open(filename, O_WRONLY | O_CREAT | O_APPEND, 0644);
                else
                    last_fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
                if (last_fd == -1)
                {
                    free(filename);
                    return (error_and_prompt_back(filename), 0);
                }
            }
            cur = cur->next;
        }
        if (last_fd != -1)
        {
            if (!dup2(last_fd, STDOUT_FILENO))
            {
                close(last_fd);
                free(filename);
                return 0;
            }
            close(last_fd);
            free(filename);
        }
    }
    return 1;
}

int open_infile(t_pars_cmd *cmd)
{
    int fd_in;
    char *infile;
    int should_free;
    int should_dup;

    should_free = 0;
    should_dup = 1; // Default to dup2, unless we have a heredoc
    if (!cmd->args || !cmd->args[0])
        should_dup = 0; // If no args, we don't need to dup2
    if (cmd->infile[0] == '"' || cmd->infile[0] == '\'')
    {
        infile = ft_substr(cmd->infile, 1, ft_strlen(cmd->infile) - 2);
        if (!infile)
            return (error_and_prompt_back(cmd->infile));
        should_free = 1;
    }
    else
        infile = cmd->infile;
    fd_in = open(infile, O_RDONLY);
    if (should_free)
        free(infile);
    if (fd_in == -1)
    {
        ft_putstr_fd("minishell: ", 2);
        perror(cmd->infile);
        global_exit_flag = 1;
        return 0;
    }
    if (should_dup == 0)
    {
        close(fd_in);
        return 1;
    }
    if (!safe_dup2(fd_in, STDIN_FILENO))
    {
        close(fd_in);
        return 0;
    }
    close(fd_in);
    return 1;
}

int open_outfile(t_pars_cmd *cmd, int append)
{
    int fd_out;
    char *out;
    int should_free;
    int should_dup;

    should_free = 0;
    should_dup = 1; // Default to dup2, unless we have a heredoc
    if (!cmd->args || !cmd->args[0])
        should_dup = 0; // If no args, we don't need to dup2
    if (cmd->outfile[0] == '"' || cmd->outfile[0] == '\'')
    {
        out = ft_substr(cmd->outfile, 1, ft_strlen(cmd->outfile) - 2);
        if (!out)
            return (error_and_prompt_back(cmd->outfile));
        should_free = 1;
    }
    else
        out = cmd->outfile;
    if (append == 0)
        fd_out = open(out, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    else
        fd_out = open(out, O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (fd_out == -1)
    {
        if (should_free)
            free(out);
        return (error_and_prompt_back(out));
    }
    if (should_dup == 0)
    {
        if (should_free)
            free(out);
        close(fd_out);
        return 1;
    }
    if (safe_dup2(fd_out, STDOUT_FILENO) == 0)
    {
        if (should_free)
            free(out);
        close(fd_out);
        return 0;
    }
    if (should_free)
        free(out);
    close(fd_out);
    return 1;
}
