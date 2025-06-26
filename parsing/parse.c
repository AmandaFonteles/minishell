/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:15 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 11:27:12 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

static int	check_consecutive_pipes(char *str)
{
	int	i;
	int	d;
	int	s;

	i = 0;
	d = 0;
	s = 0;
	while (str[i])
	{
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		if (str[i] == '|' && !(s % 2) && !(d % 2))
		{
			// Check for consecutive pipes without spaces (||)
			if (str[i + 1] == '|')
			{
				printf("minishell: syntax error near unexpected token `||'\n");
				global_exit_flag = 2;
				return (0);
			}
			// Check for consecutive pipes with spaces (| |)
			int j = i + 1;
			while (str[j] && str[j] == ' ')
				j++;
			if (str[j] == '|')
			{
				printf("minishell: syntax error near unexpected token `|'\n");
				global_exit_flag = 2;
				return (0);
			}
		}
		i++;
	}
	return (1);
}

t_pars_cmd	**parse_input(char *str)
{
	char		**tab;
	t_pars_cmd	**cmds;
	int			i;
	t_pars_cmd	*cmd;

	i = 1;
	cmds = ft_calloc(1, sizeof(t_pars_cmd **));
	if (!cmds)
		return (NULL);
	if (!check_consecutive_pipes(str))
		return (ft_free_cmds_lst(cmds), free(cmds), free(str), NULL);
	if (!ft_check(str, 0, 0, 0))
		return (ft_free_cmds_lst(cmds), free(cmds), free(str), NULL);
	tab = ft_shell_split(str, '|', 0, 0);
	free(str);
	if (!tab)
		return (ft_free_cmds_lst(cmds), free(cmds), NULL);
	*cmds = ft_lstnew_cmd(tab[0], 0);
	if (*cmds == NULL)
		return (free(tab), ft_free_cmds_lst(cmds), free(cmds), NULL);
	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i], i);
		if (!cmd)
			return (free(tab), ft_free_cmds_lst(cmds), free(cmds), NULL);
		ft_shell_add_back(cmds, cmd);
		i++;
	}
	free(tab);
	return (cmds);
}

int	check_single(char *str)
{
	if (str[0] == ':' || str[0] == '!')
	{
		if (str[1] == '\0')
		{
			return (0);
		}
	}
	return (1);
}

int	process_input(t_minishell *data)
{
	t_pars_cmd	**cmds;
	char		*trimmed_input;

	cmds = NULL;
	if (data->user_input == NULL)
	{
		ft_free_cmds_lst(cmds);
		return (1);
	}
	trimmed_input = ft_strtrim(data->user_input, " \t\n\v\f\r");
	if (!trimmed_input || !check_single(data->user_input))
	{
		free(data->user_input);
		free(trimmed_input);
		data->user_input = NULL;
		return (1);
	}
	if (*trimmed_input != '\0')
	{
		cmds = parse_input(data->user_input);
		data->user_input = NULL;
		if (cmds)
		{
			if (ft_tokenise(cmds, data))
			{
				if (data->cmd_list)
					ft_free_cmds_lst(&data->cmd_list);
				data->cmd_list = *cmds;
				free(cmds);
				data->cmd_nb = count_cmds(data->cmd_list);
			}
			else
			{
				ft_free_cmds_lst(cmds);
				free(cmds);
			}
		}
	}
	else
	{
		free(data->user_input);
		data->user_input = NULL;
	}
	free(trimmed_input);
	return (global_exit_flag);
}
