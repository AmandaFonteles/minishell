/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:15 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 17:11:20 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_fill_cmds_list(t_pars_cmd **cmds, char **tab)
{
	t_pars_cmd	*cmd;
	int			i;

	*cmds = ft_lstnew_cmd(tab[0], 0);
	if (!*cmds)
		return (0);
	i = 1;
	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i], i);
		if (!cmd)
			return (0);
		ft_shell_add_back(cmds, cmd);
		i++;
	}
	return (1);
}

t_pars_cmd	**parse_input(char *str)
{
	t_pars_cmd	**cmds;
	char		**tab;

	cmds = ft_calloc(1, sizeof(t_pars_cmd **));
	if (!cmds)
		return (NULL);
	if (!check_consecutive_pipes(str) || !ft_check(str, 0, 0, 0))
		return (ft_free_cmds_lst(cmds), free(cmds), free(str), NULL);
	tab = ft_shell_split(str, '|', 0, 0);
	free(str);
	if (!tab)
		return (ft_free_cmds_lst(cmds), free(cmds), NULL);
	if (!ft_fill_cmds_list(cmds, tab))
		return (free(tab), ft_free_cmds_lst(cmds), free(cmds), NULL);
	free(tab);
	return (cmds);
}

void	ft_process_non_empty_input(t_pars_cmd **cmds, t_minishell *data)
{
	cmds = parse_input(data->user_input);
	if (!cmds)
		return ;
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

int	process_input(t_minishell *data)
{
	t_pars_cmd	**cmds;
	char		*trimmed;

	cmds = NULL;
	if (!data->user_input)
		return (ft_free_cmds_lst(cmds), 1);
	trimmed = ft_strtrim(data->user_input, " \t\n\v\f\r");
	if (!trimmed || !check_single(data->user_input))
		return (free(data->user_input), free(trimmed),
			data->user_input = NULL, 1);
	if (*trimmed)
		ft_process_non_empty_input(cmds, data);
	else
		free(data->user_input);
	data->user_input = NULL;
	free(trimmed);
	return (global_exit_flag);
}
