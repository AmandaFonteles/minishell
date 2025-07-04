/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pwd_echo_exit_unset.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/09 11:34:22 by afontele          #+#    #+#             */
/*   Updated: 2025/07/04 17:12:48 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void builtin_pwd(t_pars_cmd *cmd) //pwd can have arguments
{
    char *cwd;
    
    g_exit_flag = 0;
    if (cmd->args[1] && cmd->args[1][0] == '-' && cmd->args[1][1] != '\0')
    {
        print_invalid_option(cmd->args[0], cmd->args[1]);
        return;
    }
    cwd = getcwd(NULL, 0);
    if (!cwd)
    {
        error_and_prompt_back("getcwd");
        return ;
    }
    ft_putstr_fd(cwd, 1);
    ft_putstr_fd("\n", 1);
    free(cwd);
}

static int is_n(char *str)
{
    int i;

    i = 2;
    if (str[0] != '-' || str[1] != 'n')
        return (0);
    while (str[i] && str[i]== 'n')
        i++;
    if (str[i] != '\0')
        return (0);
    return (1);
}

static int parse_flag(char **args, int *i)
{
    int n_flag;

    n_flag = 0;
    while(args[*i] && is_n(args[*i]))
    {
        n_flag = 1;
        (*i)++;
    }
    return (n_flag);
}

//break into smaller functions
void builtin_echo(t_pars_cmd *cmd)
{
    int i;
    int n_flag;

    i = 1;
    g_exit_flag = 0;
    n_flag = parse_flag(cmd->args, &i);
    while (cmd->args[i])
    {
        ft_putstr_fd(cmd->args[i], 1);
        if (cmd->args[i + 1])
            ft_putstr_fd(" ", 1);
        i++;
    }
    if (!n_flag)
        ft_putstr_fd("\n", 1);
}

void    builtin_unset(t_minishell *data, t_pars_cmd *cmd)
{
    int i;

    i = 1;
    g_exit_flag = 0;
    while (cmd->args[i])
    {
        if (cmd->args[i][0] == '-')
        {
            print_invalid_option(cmd->args[0], cmd->args[i]);
            return ;
        }
        else if (!is_valid_identifier(cmd->args[i]))
            print_invalid_identifier("unset", cmd->args[i]);
        else
        {
            remove_tenv(&data->exported, cmd->args[i]);
            remove_tenv(&data->env, cmd->args[i]);
        }
        i++;
    }
}
static int too_many_args(char **args, int i)
{
    if (args[i] && args[i + 1])
    {
        g_exit_flag = 1;
        print_exit_error(NULL, "too many arguments");
        return (1);
    }
    return (0);
}

void builtin_exit(t_minishell *data, t_pars_cmd *cmd)
{
    int i;
    long long arg;

    i = 1;
    if (cmd->args[1] == NULL)
    {
        free_to_exit(data);
        ft_putstr_fd("exit\n", 1);
        exit(0);
    }
    if (ft_strcmp(cmd->args[i], "--") == 0)
    {
        if (!cmd->args[i + 1])
        {
            free_to_exit(data);
            ft_putstr_fd("exit\n", 1);
            exit(0);
        }
        i++;
    }
    if (cmd->args[i] && !get_exit_code(cmd->args[i], &arg))
    {
        print_exit_error(cmd->args[i], "numeric argument required");
        free_to_exit(data);
        exit(2);
    }
    if (too_many_args(cmd->args, i))
        return ;
    ft_putstr_fd("exit\n", 1);
    free_to_exit(data);
    exit((unsigned char)arg);
}
