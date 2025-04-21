/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cd.c                                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/07 14:48:45 by afontele          #+#    #+#             */
/*   Updated: 2025/04/21 18:01:42 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void cd_update_pwd(t_minishell *data, char *old_pwd)
{
    char *new_pwd;

    new_pwd = getcwd(NULL, 0);
    if (!new_pwd)
    {
        ft_putstr_fd("minishell: cd: ", 2);
        perror("getcwd");
        data->exit_code = 1;
        return ;
    }
    if (!update_env_value_in_list(data->env, "PWD", new_pwd) ||
        !update_env_value_in_list(data->exported, "PWD", new_pwd) ||
        !update_env_value_in_list(data->env, "OLDPWD", old_pwd) ||
        !update_env_value_in_list(data->exported, "OLDPWD", old_pwd))
    {
        ft_putstr_fd("minishell: cd: ", 2);
        perror("update_env_value_in_list");
        data->exit_code = 1;
        free(new_pwd);
        return ;
    }
    free(new_pwd);
}

void    cd_home(t_minishell *data, char *old_pwd)
{
    char *home;

    home = ft_getenv("HOME", data);
    if (!home || chdir(home) == -1)
    {
        ft_putstr_fd("minishell: cd: HOME not set\n", 2);
        data->exit_code = 1;
        return ;
    }
    free(home);
    if (!update_env_value_in_list(data->env, "OLDPWD", old_pwd) ||
        !update_env_value_in_list(data->exported, "OLDPWD", old_pwd))
    {
        perror("update_env_value_in_list");
        data->exit_code = 1;
        return ;
    }
}

void    cd_dash(t_minishell *data, char *old_pwd)
{
    char *prev_oldpwd;

    prev_oldpwd = ft_getenv("OLDPWD", data);
    if (!prev_oldpwd)
    {
        ft_putstr_fd("minishell: cd: OLDPWD not set", 2);
        data->exit_code = 1;
        free(prev_oldpwd);
        return ;
    }
    if (chdir(prev_oldpwd) == -1)
    {
        error_chdir(data, prev_oldpwd);
        return ;
    }
    ft_putstr_fd(prev_oldpwd, 1);
    ft_putstr_fd("\n", 1);
    free(prev_oldpwd);
    if (!update_env_value_in_list(data->env, "OLDPWD", old_pwd) ||
        !update_env_value_in_list(data->exported, "OLDPWD", old_pwd))
    {
        perror("update_env_value_in_list");
        data->exit_code = 1;
        return ;
    }
}

void    cd_to_path(t_minishell *data, char *path, char *old_pwd)
{
    if (chdir(path) == -1)
    {
        ft_putstr_fd("minishell: cd: ", 2);
        perror(path);
        data->exit_code = 1;
        return ;
    }
    cd_update_pwd(data, old_pwd);
}

void builtin_cd(t_minishell *data, t_pars_cmd *cmd)
{
    char *old_pwd;
    
    if (strlen_array(cmd->args) > 2)
    {
        data->exit_code = 1;
        ft_putstr_fd("minishell: cd: too many arguments\n", 2);
        return ;
    }
    old_pwd = getcwd(NULL, 0);
    if (!old_pwd)
    {
        perror("getcwd");
        data->exit_code = 1;
        return ;
    }
    if (cmd->args[1] == NULL || ft_strcmp(cmd->args[1], "~") == 0)
        cd_home(data, old_pwd);
    else if (ft_strcmp(cmd->args[1], "-") == 0)
        cd_dash(data, old_pwd);
    else
        cd_to_path(data, cmd->args[1], old_pwd);
    free(old_pwd);
}
