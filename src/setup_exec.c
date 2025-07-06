/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   setup_exec.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/26 14:55:12 by afontele          #+#    #+#             */
/*   Updated: 2025/07/07 00:17:48 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

// generate heredocs and redirect execution to pipeline, singlebuiltin or single cmd
void setup_exec(t_minishell *data)
{
  if (!data->cmd_list)
    return;
  if (!generate_heredocs(data))
    return;
  if (data->cmd_nb == 1)
  {
    if (is_builtin(data->cmd_list))
      single_builtin(data, data->cmd_list);
    else
      exec_uniq_cmd(data); // change from void to return int
  }
  else
    multiple_cmds(data); // change from void to return int
}
// hub to create pipes and processes for multiple commands
void multiple_cmds(t_minishell *data)
{
  int i;

  i = 0;
  if (data->cmd_nb < 2)
    return;
  data->pipe_ends = (int **)malloc(sizeof(int *) * (data->cmd_nb - 1));
  if (!data->pipe_ends)
  {
    error_and_prompt_back("error malloc pipe_ends"); // Error allocating memory
    return;
  }
  while (i < data->cmd_nb - 1)
  {
    data->pipe_ends[i] = (int *)malloc(sizeof(int) * 2);
    if (!data->pipe_ends[i])
    {
      error_and_prompt_back("error malloc pipe_ends"); // Error allocating memory
      return;
    }
    data->pipe_ends[i][0] = -1; // Initialize pipe ends to -1
    data->pipe_ends[i][1] = -1; // Initialize pipe ends to -1
    i++;
  }
  if (!setup_multiple_cmd(data))
    return;
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
        // Gestion des signaux pour les processus enfants
        signal(SIGINT, ft_signal_child);
        signal(SIGQUIT, SIG_DFL);

        if (!setup_redirections(cmd))
        {
            free_to_exit(data);
            exit(1);
        }
        if (cmd->args && cmd->args[0])
            execute(data, cmd);
        free_to_exit(data);
        exit(0);
    }

    // Ignorer les signaux pendant l'attente de l'enfant
    signal(SIGINT, SIG_IGN);
    signal(SIGQUIT, SIG_IGN);

    waitpid(cmd->pid, &status, 0);

    // Restaurer les signaux pour la boucle principale
    signal(SIGINT, ft_signal_main);
    signal(SIGQUIT, SIG_IGN);

    if (WIFEXITED(status))
    {
        int exit_code = WEXITSTATUS(status);
        if (exit_code == 130) // Ctrl+C dans l'enfant
        {
            global_exit_flag = 130;
        }
        else
            global_exit_flag = exit_code;
    }
    else if (WIFSIGNALED(status))
    {
        if (WTERMSIG(status) == SIGQUIT)
            write(2, "Quit (core dumped)\n", 20);
        global_exit_flag = 128 + WTERMSIG(status);
    }
}
