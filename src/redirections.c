/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:56:58 by afontele          #+#    #+#             */
/*   Updated: 2025/05/29 20:45:51 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int setup_redirections(t_pars_cmd *cmd)
{
    if (cmd->infile)
    {
        if (!open_infile(cmd))
            return 0;
    }
    else if (cmd->heredoc && cmd->heredoc[0])
        if (!redirect_heredoc(cmd))
            return 0;
    if (cmd->outfile)
    {
        if (!open_outfile(cmd, cmd->append))
            return 0;
    }
    return 1;
}

int open_infile(t_pars_cmd *cmd)
{
    int fd_in;
    char *infile;

    infile = ft_substr(cmd->infile, 1, ft_strlen(cmd->infile) - 2);
    fd_in = open(infile, O_RDONLY);
    free(infile);
    if (fd_in == -1)
    {
        ft_putstr_fd("minishell: ", 2);
        perror(cmd->infile);
        global_exit_flag = 1;
        return 0;
    }
    if (!safe_dup2(fd_in, STDIN_FILENO))
        return 0;
    close(fd_in);
    return 1;
}

int open_outfile(t_pars_cmd *cmd, int append)
{
    int fd_out;
    char *out;
    
    if (cmd->outfile[0] == '"' || cmd->outfile[0] == '\'')
        out = ft_substr(cmd->outfile, 1, ft_strlen(cmd->outfile) - 2);
    else
        out = cmd->outfile;
    if (append == 0)
        fd_out = open(out, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    else
        fd_out = open(out, O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (fd_out == -1)
        return (error_and_prompt_back(out));
    if (safe_dup2(fd_out, STDOUT_FILENO) == 0)
        return 0;
    close(fd_out);
    return 1;
}
