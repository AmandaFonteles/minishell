/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tokenization.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:54 by adregis           #+#    #+#             */
/*   Updated: 2025/06/23 12:01:53 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_manage_redir(t_pars_cmd *cmd)
{
	t_token	*cur;

	cur = (*cmd->token);
	while (cur)
	{
		if (cur->type == FILE_IN && cur->next && cur->next->type == OPEN_FILE)
		{
			cmd->infile = ft_strdup(cur->next->word);
			if (!cmd->infile)
				return (0);
		}
		else if (cur->type == FILE_OUT && cur->next && cur->next->type == EXIT_FILE)
		{
			cmd->outfile = ft_strdup(cur->next->word);
			cmd->append = 0;
			if (!cmd->outfile)
				return (0);
		}
		else if (cur->type == FILE_OUT_SUR && cur->next && cur->next->type == EXIT_FILE_RET)
		{
			cmd->outfile = ft_strdup(cur->next->word);
			cmd->append = 1;
			if (!cmd->outfile)
				return (0);
		}
		cur = cur->next;
	}
	return (1);
}

int	ft_create_args(t_pars_cmd *cmd)
{
	t_token	*cur;
	int		i;

	i = 0;
	cur = (*cmd->token);
	cmd->args = ft_calloc(ft_count_args(cmd) + 1, sizeof(char *));
	while (cur)
	{
		if (cur->word && cur->word[0] != 34 && cur->type == ARG)
		{
			i += ft_split_word(cur->word, cmd->args, i);
			if (i == -1)
				return (0);
		}
		else if (cur->type == ARG && cur->word)
		{
			cmd->args[i] = dark_strtrim(cur->word, "\"");
			if (!cmd->args[i])
				return (0);
			i++;
		}
		cur = cur->next;
	}
	cmd->args[i] = NULL;
	return (1);
}

int	ft_remove_quote(t_pars_cmd *cmd)
{
	t_token	*cur;
	char	*tmp;

	cur = (*cmd->token);
	while (cur)
	{
		if (cur->type != LIMITOR)
		{
			tmp = cur->word;
			cur->word = ft_strtrim(cur->word, "\"");
			free(tmp);
			if (!cur->word)
				return (0);
		}
		cur = cur->next;
	}
	return (1);
}

int	ft_tokenise(t_pars_cmd **cmds, t_minishell *data)
{
	t_pars_cmd	*current;

	current = (*cmds);
	while (current)
	{
		current->token = ft_create_token(current->cmd, data);
		if (!current->token)
			return (0);
		if (!ft_manage_redir(current))
			return (0);
		if (!ft_create_args(current))
			return (0);
		if (!ft_remove_quote(current))
			return (0);
		if (!fill_heredocs(current))
			return (0);
		current = current->next;
	}
	return (1);
}

t_token	**ft_create_token(char *str, t_minishell *data)
{
	char	**tab;
	t_token	**token;
	t_token	*new;
	int		i;

	token = ft_calloc(1, sizeof(token));
	i = 1;
	tab = ft_split_token(str);
	if (!ft_parse_error(tab))
	{
		ft_free_tab(tab, 1);
		return (NULL);
	}
	(*token) = ft_lstnew_token(tab[0]);
	if (!(*token))
		return (NULL);
	while (tab[i])
	{
		new = ft_lstnew_token(tab[i]);
		if (!new)
			return (NULL);
		ft_lstadd_back_token(token, new);
		i++;
	}
	if (!ft_set_type(token) || !ft_expend_words(token, data))
		return (NULL);
	ft_free_tab(tab, 1);
	return (token);
}
