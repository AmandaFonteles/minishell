/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execve_hub.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/31 10:59:29 by afontele          #+#    #+#             */
/*   Updated: 2025/06/03 13:32:12 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"
// Resolve and execute commands via execve.

void    execute(t_minishell *data, t_pars_cmd *cur_cmd)
{
    if (!cur_cmd->args || !cur_cmd->args[0])
    {
        print_cmd_not_found(data, NULL);
        free_to_exit(data);
        exit(global_exit_flag);
    }
    if (is_builtin(cur_cmd))
    {
        builtin_hub(data, cur_cmd);
        return ;
    }
    else
    {
        resolve_and_exec(data, cur_cmd);
        return ;
    }    
}

char *exec_make_path(t_minishell *data, t_pars_cmd *cmd)
{
    char *path;
    char *cmd_path;

    path = ft_getenv("PATH", data);
    if (!path || !*path)
    {
        print_cmd_not_found(data, cmd->args[0]);
        free_to_exit(data);
        exit(global_exit_flag);
    }
    cmd_path = build_path(path, cmd->args[0]);
    if (!cmd_path)
    {
        print_cmd_not_found(data, cmd->args[0]);
        free_to_exit(data);
        exit(global_exit_flag);
    }
    return (cmd_path);
}

void    resolve_and_exec(t_minishell *data, t_pars_cmd *cmd)
{
    char *cmd_path;

    if (!check_full_path(cmd->args[0]))
        cmd_path = exec_make_path(data, cmd);
    else
    {
        cmd_path = ft_strdup(cmd->args[0]);
        if (access(cmd_path, X_OK) == -1)
        {
            print_cmd_not_found(data, cmd->args[0]);
            free(cmd_path);
            free_to_exit(data);
            exit(global_exit_flag);
        }
    }
    if (execve(cmd_path, cmd->args, data->envp) == -1)
        execve_error(data, cmd_path);
    free(cmd_path);
}

char *safe_join(char *str, char* cmd)
{
    char *tmp;
    char *full_path;

    tmp = ft_strjoin(str, "/");
    if (!tmp)
        return (NULL);
    full_path = ft_strjoin(tmp, cmd);
    free(tmp);
    if (!full_path)
        return (NULL);
    return (full_path);
}

char *build_path(char *path, char *cmd)
{
    char *full_path;
    char **possible_paths;
    int i;

    i = 0;
    possible_paths = ft_split(path, ':');
    if (!possible_paths)
        error_and_prompt_back("error malloc"); // Error allocating memory
    while (possible_paths[i])
    {
        full_path = safe_join(possible_paths[i], cmd);
        if (!full_path)
            return (free_arraystr(possible_paths), NULL);
        if (access(full_path, X_OK) == 0)
        {
            free_arraystr(possible_paths);
            return (full_path);
        }
        free(full_path);
        i++;
    }
    free_arraystr(possible_paths);
    return (NULL);
}
//should I exit the program if execve fail?
void    execve_error(t_minishell *data, char *cmd_path)
{
    perror(data->cmd_list->args[0]);
    global_exit_flag = 127;
    free(cmd_path);
    if (errno == ENOENT)
        global_exit_flag = 127; // Error command not found
    else if (errno == EACCES)
        global_exit_flag = 126; // Error permission denied
    else
        global_exit_flag = 1; // Error other
    free_to_exit(data);
}

int check_full_path(char *cmd)
{
    return (ft_strchr(cmd, '/') != NULL);
}
