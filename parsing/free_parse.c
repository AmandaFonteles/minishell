/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free_parse.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:57 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 09:51:59 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_free_tab(char **tab, int nb)
{
	int	i;

	(void)nb;
	i = 0;
	while (tab && tab[i])
		free(tab[i++]);
	free(tab);
}

void	ft_free_env(t_env **env)
{
	t_env	*cur;
	t_env	*tmp;

	cur = (*env);
	while (cur)
	{
		if (cur->title)
			free(cur->title);
		if (cur->value)
			free(cur->value);
		tmp = cur->next;
		free(cur);
		cur = tmp;
	}
}

void	ft_free_token(t_token *token)
{
	if (token)
	{
		if (token->word)
		{
			free(token->word);
		}
		free(token);
	}
}

void	ft_free_tokenlst(t_token **token)
{
	t_token	*cur;
	t_token	*tmp;

	if (token)
	{
		cur = (*token);
		while (cur)
		{
			tmp = cur->next;
			ft_free_token(cur);
			cur = tmp;
		}
		free(token);
	}
}

void	ft_free_cmd(t_pars_cmd *cmd)
{
	if (cmd)
	{
		if (cmd->cmd)
			free(cmd->cmd);
		if (cmd->token)
			ft_free_tokenlst(cmd->token);
		if (cmd->args)
			ft_free_tab(cmd->args, 0);
		if (cmd->delimiters)
			free_arraystr(cmd->delimiters);
		if (cmd->infile)
			free(cmd->infile);
		if (cmd->outfile)
			free(cmd->outfile);
		if (cmd->heredoc)
			free_arraystr(cmd->heredoc);
		free(cmd);
		cmd = NULL;
	}
}

void	ft_free_cmds_lst(t_pars_cmd **cmds)
{
	t_pars_cmd	*cur;
	t_pars_cmd	*tmp;

	if (cmds)
	{
		cur = (*cmds);
		while (cur)
		{
			tmp = cur->next;
			ft_free_cmd(cur);
			cur = tmp;
		}
		*cmds = NULL;
	}
}
