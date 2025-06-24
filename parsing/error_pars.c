/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:27 by adregis           #+#    #+#             */
/*   Updated: 2025/06/24 16:58:22 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_print_exit_free_all(t_pars_cmd **cmds)
{
	(void)cmds;
	printf("exit\n");
	ft_free_env(get_adress());
	rl_clear_history();
	exit(0);
}

int	ft_validate_redir(char c, int j, char **words, int i)
{
	if ((c == '>' && j >= 3) || (c == '<' && j >= 4))
	{
		if (c == '>')
			printf("minishell: syntax error near unexpected token `%s'\n", (j == 3 ? ">" : ">>"));
		else
			printf("minishell: syntax error near unexpected token `%s'\n", (j == 4 ? "<" : (j == 5 ? "<<" : "<<<")));
		return (0);
	}
	if (!words[i + 1])
	{
		printf("minishell: syntax error near unexpected token `newline'\n");
		return (0);
	}
	if (words[i + 1][0] == '>' || words[i + 1][0] == '<' || words[i + 1][0] == '|')
	{
		printf("minishell: syntax error near unexpected token `%s'\n", words[i + 1]);
		return (0);
	}
	return (1);
}

int	ft_check_redir(char **words, int i)
{
	char	c = words[i][0];
	int		j = 1;

	while (words[i][j])
	{
		if (words[i][j] != c)
		{
			printf("minishell: syntax error near unexpected token `%s'\n", words[i]);
			return (0);
		}
		j++;
	}
	return ft_validate_redir(c, j, words, i);
}

int	ft_parse_error(char **words)
{
	int	i;

	i = 0;
	while (words[i])
	{
		if (words[i][0] == '>' || words[i][0] == '<')
		{
			if (!ft_check_redir(words, i))
			{
				global_exit_flag = 2;
				return (0);
			}
				
		}
		else if (words[i][0] == '|')
		{
			printf("minishell: syntax error near unexpected token `|'\n");
			global_exit_flag = 2;
			return (0);
		}
		i++;
	}
	return (1);
}
