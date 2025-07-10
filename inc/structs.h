/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   structs.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/26 16:00:39 by afontele          #+#    #+#             */
/*   Updated: 2025/07/10 09:19:07 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef STRUCTS_H
# define STRUCTS_H

typedef struct s_exp_data
{
	char	*arg;
	char	*key;
	char	*value;
	int		has_equal;
}	t_exp_data;

typedef struct s_parsed_command
{
	char					*cmd;
	struct token			**token;
	int						cmd_index;
	pid_t					pid;
	int						hd_nb;
	char					**heredoc;
	char					**delimiters;
	char					*infile;
	char					*outfile;
	int						append;
	char					**args;
	struct s_parsed_command	*next;
}	t_pars_cmd;

typedef struct s_env
{
	char			*title;
	char			*value;
	int				export;
	struct s_env	*next;
}	t_env;

typedef struct s_minishell
{
	char		*user_input;
	char		**envp;
	t_env		*env;
	t_env		*exported;
	t_pars_cmd	*cmd_list;
	int			cmd_nb;
	int			**pipe_ends;
}	t_minishell;

#endif
