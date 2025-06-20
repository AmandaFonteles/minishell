/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:15 by adregis           #+#    #+#             */
/*   Updated: 2025/06/20 16:07:26 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

t_pars_cmd	**parse_input(char *str)
{
	char		**tab;
	t_pars_cmd	**cmds;
	int			i;
	t_pars_cmd	*cmd;

	i = 1;
	cmds = ft_calloc(1, sizeof(t_pars_cmd **));
	if (!cmds || !ft_chweck(str, 0, 0, 0))
		return (ft_free_cmds_lst(cmds), NULL);
	tab = ft_shell_split(str, '|', 0, 0);
	free(str);
	if (!tab)
		return (NULL);
	*cmds = ft_lstnew_cmd(tab[0], 0);
	if (*cmds == NULL)
		return (free(tab), NULL);
	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i], i);
		if (!cmd)
			return (NULL);
		ft_shell_add_back(cmds, cmd);
		i++;
	}
	free(tab);
	return (cmds);
}

t_pars_cmd	*ft_lstnew_cmd(char *cmd, int cmd_index)
{
	t_pars_cmd	*new;

	new = ft_calloc(1, sizeof(t_pars_cmd));
	if (!new)
		return (NULL);
	new->cmd = cmd;
	new->cmd_index = cmd_index;
	new->pid = 0;
	new->hd_nb = 0;
	new->heredoc = NULL;
	new->delimiters = NULL;
	new->infile = NULL;
	new->outfile = NULL;
	new->append = 0;
	new->args = NULL;
	new->next = NULL;
	return (new);
}

t_pars_cmd	*ft_lstlast_cmds(t_pars_cmd *cmd)
{
	if (!cmd)
		return (NULL);
	while (cmd->next)
		cmd = cmd->next;
	return (cmd);
}

void	ft_shell_add_back(t_pars_cmd **cmds, t_pars_cmd *new)
{
	t_pars_cmd	*temp;

	temp = *cmds;
	temp = ft_lstlast_cmds(temp);
	if (!temp)
		*cmds = new;
	else
		temp->next = new;
}

static int	count_cmds(t_pars_cmd *cmd_list)
{
	t_pars_cmd	*cur;
	int			count;

	count = 0;
	cur = cmd_list;
	while (cur)
	{
		count++;
		cur = cur->next;
	}
	return (count);
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

	// Vérifier si l'input ne contient que des espaces
	trimmed_input = ft_strtrim(data->user_input, " \t\n\v\f\r");
	if (!trimmed_input)
	{
		free(data->user_input);
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
				ft_free_cmds_lst(cmds);
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
