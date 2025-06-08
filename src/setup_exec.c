/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   setup_exec.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/26 14:55:12 by afontele          #+#    #+#             */
/*   Updated: 2025/06/08 11:54:08 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"


//generate heredocs and redirect execution to pipeline, singlebuiltin or single cmd
void   setup_exec(t_minishell *data)
{
    if (!data->cmd_list)
        return ;
    if (!generate_heredocs(data))
        return ;
    if (data->cmd_nb == 1)
    {
        if (is_builtin(data->cmd_list))
            single_builtin(data, data->cmd_list);
        else
            exec_uniq_cmd(data);  //change from void to return int
    }
    else
        multiple_cmds(data); //change from void to return int
}
//hub to create pipes and processes for multiple commands
void    multiple_cmds(t_minishell *data)
{
    int i;

    i = 0;
    if (data->cmd_nb < 2)
        return ;
    data->pipe_ends = (int **)malloc(sizeof(int *) * (data->cmd_nb - 1));
    if (!data->pipe_ends)
    {
        error_and_prompt_back("error malloc pipe_ends"); // Error allocating memory
        return ;
    }
    while (i < data->cmd_nb - 1)
    {
        data->pipe_ends[i] = (int *)malloc(sizeof(int) * 2);
        if (!data->pipe_ends[i])
        {
            error_and_prompt_back("error malloc pipe_ends"); // Error allocating memory
            return ;
        }
        i++;
    }
    if (!setup_multiple_cmd(data))
        return ;
}

int setup_multiple_cmd(t_minishell *data)
{
    if (!create_pipes(data))
        return (0);
    if (!create_processes(data))
        return (0);
    free_pipes(data);
    return (1);
}
 // execute a single command without pipes
void exec_uniq_cmd(t_minishell *data)
{
    int status;
    t_pars_cmd *cmd;

    cmd = data->cmd_list;
    cmd->pid = fork();
    if (cmd->pid == -1)
    {
        error_and_prompt_back("error fork");
        return ;
    }
    if (cmd->pid == 0)
    {
        if (!setup_redirections(cmd))
            exit(1);
        execute(data, cmd);
        exit(1);
    }
    waitpid(cmd->pid, &status, 0);
    if (WIFEXITED(status))
        global_exit_flag = WEXITSTATUS(status);
    else if (WIFSIGNALED(status))
    {
        if (WTERMSIG(status) == SIGINT)
        {
            global_exit_flag = 130;
        }
        else if (WTERMSIG(status) == SIGQUIT)
            write(2, "Quit (core dumped)\n", 20);
        global_exit_flag = 128 + WTERMSIG(status);
    }
}
