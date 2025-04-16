/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 16:56:58 by afontele          #+#    #+#             */
/*   Updated: 2025/04/16 17:52:17 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int setup_redirections(t_pars_cmd *cmd, t_minishell *data)
{
    if (cmd->infile)
    {
        if (!open_infile(cmd, data))
            return 0; //fail
    }
    else if (cmd->heredoc && cmd->heredoc[0])
        redirect_heredoc(data, cmd);
    if (cmd->outfile)
    {
        if (!open_outfile(cmd, data, cmd->append))
            return 0; //fail
    }
    return 1;
}

int open_infile(t_pars_cmd *cmd, t_minishell *data)
{
    int fd_in;

    fd_in = open(cmd->infile, O_RDONLY);
    if (fd_in == -1)
    {
        ft_putstr_fd("minishell: ", 2);
        perror(cmd->infile);
        data->exit_code = 1; //verify this! Can be another error code
        return 0; //fail
    }
    if (!safe_dup2(fd_in, STDIN_FILENO, data))
        return 0; //fail
    close(fd_in);
    return 1; //success
}

int open_outfile(t_pars_cmd *cmd, t_minishell *data, int append)
{
    int fd_out;
    
    if (append == 0)
        fd_out = open(cmd->outfile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    else if (append == 1)
        fd_out = open(cmd->outfile, O_WRONLY | O_CREAT | O_APPEND, 0644);
    else
    {
        data->exit_code = error_to_excode(data, cmd->outfile, 1);
        return 0;
    }
    if (fd_out == -1)
    {
        data->exit_code = error_to_excode(data, cmd->outfile, 1);
        return 0; //fail
    }
    if (dup2(fd_out, STDOUT_FILENO) == -1)
    {
        data->exit_code = error_to_excode(data, "dup2", 1);
        close(fd_out);
        return 0; //fail
    }
    close(fd_out);
    return 1; //success
}
