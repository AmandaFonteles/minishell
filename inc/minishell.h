/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/05 17:04:11 by tautin--          #+#    #+#             */
/*   Updated: 2025/07/06 23:49:14 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINISHELL_H
# define MINISHELL_H

/****************/
/* Lib includes */
/****************/

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <signal.h>
# include <readline/readline.h>
# include <readline/history.h>
# include <limits.h>
# include <fcntl.h>
# include <sys/types.h>
# include <sys/wait.h>
# include <errno.h>
# include "structs.h"
# include <signal.h>
# include "token.h"
# include "../libft/inc/libft.h"

extern int	global_exit_flag;

/*TEST*/
void	basic_parse_input(t_minishell *data);

/* MAIN.C */
void	main_loop(t_minishell *data);

/*init - prepare the data struct*/
int		init_data(t_minishell *data, char **envp);
void	init_structs(t_minishell *data);
int		init_envp(t_minishell *data);
t_env	*create_env_node(t_minishell *data, char *env_str); //maybe open a .c for all the creation of nodes?
int		add_env(t_minishell *data, char *env, t_env **list);

/*error*/
void	error_to_exit(t_minishell *data, char *msg); //exit the program
int		error_and_prompt_back(char *msg);
int		safe_dup2(int oldfd, int newfd);
int		print_invalid_option(char *builtin, char *arg);
void	error_chdir(char *path);

/* EXECVE_HUB.C */
void	execute(t_minishell *data, t_pars_cmd *cur_cmd);
char	*exec_make_path(t_minishell *data, t_pars_cmd *cmd);
void	resolve_and_exec(t_minishell *data, t_pars_cmd *cmd);
char	*safe_join(char *str, char *cmd);
char	*build_path(char *path, char *cmd);
void	execve_error(t_minishell *data, char *cmd_path);
int		check_full_path(char *cmd);

/* SETUP_EXEC.C */
void	setup_exec(t_minishell *data);
void	multiple_cmds(t_minishell *data);
int		setup_multiple_cmd(t_minishell *data);
void	exec_uniq_cmd(t_minishell *data);

/* PROCESSES.C */
int		create_processes(t_minishell *data);
void	setup_child(t_minishell *data, t_pars_cmd *cur_cmd);
void	wait_loop(t_minishell *data);

/* PIPES.C */
int		create_pipes(t_minishell *data);
void	close_unused_pipes(t_minishell *data, t_pars_cmd *cur_cmd);
void	close_all_pipes(t_minishell *data);

/* REDIRECTIONS */
int		setup_redirections(t_pars_cmd *cmd);
int		open_infile(t_pars_cmd *cmd);
int		open_outfile(t_pars_cmd *cmd, int append);

/* HEREDOC.C */
int		write_heredoc_file(char *filename, char *delimiter, t_minishell *data);
int		generate_heredocs(t_minishell *data);
char	*last_heredoc_path(t_pars_cmd *cmd);
int		redirect_heredoc(t_pars_cmd *cmd);

/* BUILTINS.C */
int		is_builtin(t_pars_cmd *command);
void	single_builtin(t_minishell *data, t_pars_cmd *cmd);
int		dup_and_close(int fd_in, int fd_out);
void	builtin_hub(t_minishell *data, t_pars_cmd *cmd);

/* BUILTIN_UTILS.C */
int		isnbr(char *str);
long long modif_atoll(const char *str, int *overflow);
int        get_exit_code(char *str, long long *value);
int		is_valid_identifier(char *s);
void	remove_tenv(t_env **list, char *arg);
int		strlen_array(char **arr);

/* PWD_ECHO_EXIT_UNSET.C */
void	builtin_pwd(t_pars_cmd *cmd);
void	builtin_echo(t_pars_cmd *cmd);
void	builtin_exit(t_minishell *data, t_pars_cmd *cmd);
void	builtin_unset(t_minishell *data, t_pars_cmd *cmd);

/* CD.C */
void	cd_update_pwd(t_minishell *data, char *old_pwd);
void	cd_home(t_minishell *data, char *old_pwd);
void	cd_dash(t_minishell *data, char *old_pwd);
void	cd_to_path(t_minishell *data, char *path, char *old_pwd);
void	builtin_cd(t_minishell *data, t_pars_cmd *cmd);

/* ENV_EXP.C */
void	builtin_env(t_minishell *data, t_pars_cmd *cmd);
void	builtin_export(t_minishell *data, t_pars_cmd *cmd);
void	print_exported(t_env *cur_exp_node);
int		extract_key_value(char *arg, char **key, char **value);
int		update_env_value_in_list(t_env *list, char *key, char *value);
void	export_or_update(t_minishell *data, char *arg);
void	check_exp(t_minishell *data, char *arg);
void	check_env(t_minishell *data, char *arg);

/* ENV_MANAGEMENT.C */
char	*ft_getenv(char *variable, t_minishell *data);
t_env	**get_adress(void);
char	*white_get_env(char *name, t_minishell *data);
void	init_env_list(void);
t_minishell	*get_minishell(void);

/* FREE.C */
void	free_pipes(t_minishell *data);
void	free_arraystr(char **arr);
void	cleanup_heredocs(t_minishell *data);
void	free_cmd_node(t_pars_cmd *cmd);
void	free_all(t_minishell *data);
void	free_to_exit(t_minishell *data);
void	free_env(t_env *list);
void	ft_free_cmds_lst(t_pars_cmd **cmds);

/* ERROR.C */
void print_cmd_not_found(t_minishell *data, char *cmd);
void print_cmd_no_file(t_minishell *data, char *cmd);
void print_exit_error(char *arg, char *msg);
void print_invalid_identifier(char *builtin, char *arg);

/* SIGNALS.C */
void	ft_signal(int sig);
void	ft_signal_cat(int sig);
void	ft_handle_heredoc_signal(int sig);

#endif
