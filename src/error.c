/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/31 12:08:03 by afontele          #+#    #+#             */
/*   Updated: 2025/07/04 17:11:18 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"
//this exit minishell
void error_to_exit(t_minishell *data, char *msg)
{
    (void)data;
    ft_putstr_fd("minishell: ", 2);
    if (msg)
        perror(msg);
    free_to_exit(data);
    exit(1);
}
//this displays the error, set the exit code and return to the prompt
//inside main_loop, but didin't fork yet
int    error_and_prompt_back(char *msg)
{
    ft_putstr_fd("minishell: ", 2);
    if (msg)
        perror(msg);
    g_exit_flag = 1;
    return (0);
}
//dup2 and check for errors
int safe_dup2(int oldfd, int newfd)
{
    if (dup2(oldfd, newfd) == -1)
    {
        ft_putstr_fd("minishell: ", 2);
        perror("dup2");
        //do I need to close oldfd and newfd?
        close(oldfd);
        g_exit_flag = 1;
        return (0);
    }
    return (1);
}


void print_cmd_not_found(t_minishell *data, char *cmd)
{
    if (check_full_path(cmd))
    {
        ft_putstr_fd("minishell: ", 2);
        ft_putstr_fd(cmd, 2);
        ft_putstr_fd(": No such file or directory\n", 2);
    }
    else
    {
            ft_putstr_fd("minishell: ", 2);
        if (cmd)
            ft_putstr_fd(cmd, 2);
        else if (data->cmd_list && data->cmd_list->args && data->cmd_list->args[0])
            ft_putstr_fd(data->cmd_list->args[0], 2);
        ft_putstr_fd(": command not found\n", 2);
    }
    g_exit_flag = 127;
}

void print_cmd_no_file(t_minishell *data, char *cmd)
{
    ft_putstr_fd("minishell: ", 2);
    if (cmd)
        ft_putstr_fd(cmd, 2);
    else if (data->cmd_list && data->cmd_list->args && data->cmd_list->args[0])
        ft_putstr_fd(data->cmd_list->args[0], 2);
    ft_putstr_fd(": No such file or directory\n", 2);
    g_exit_flag = 127;
}

void print_exit_error(char *arg, char *msg)
{
    ft_putstr_fd("exit\n", 1);
    ft_putstr_fd("minishell: exit: ", 2);
    if (arg)
    {
        ft_putstr_fd(arg, 2);
        ft_putstr_fd(": ", 2);
    }
    ft_putstr_fd(msg, 2);
    ft_putstr_fd("\n", 2);
}

void print_invalid_identifier(char *builtin, char *arg)
{
    ft_putstr_fd("minishell: ", 2);
    ft_putstr_fd(builtin, 2);
    ft_putstr_fd(": '", 2);
    ft_putstr_fd(arg, 2);
    ft_putstr_fd("': not a valid identifier\n", 2);
    g_exit_flag = 1;
}

int    print_invalid_option(char *builtin, char *arg)
{
    ft_putstr_fd("minishell: ", 2);
    ft_putstr_fd(builtin, 2);
    ft_putstr_fd(": '", 2);
    ft_putchar_fd(arg[0], 2);
    ft_putchar_fd(arg[1], 2);
    ft_putstr_fd("': invalid option\n", 2);
    g_exit_flag = 1;
    return (0);
}

void    error_chdir(char *path)
{
    ft_putstr_fd("minishell: cd: ", 2);
    ft_putstr_fd(path, 2);
    ft_putstr_fd(": ", 2);
    perror("chdir");
    free(path);
    g_exit_flag = 1;
}