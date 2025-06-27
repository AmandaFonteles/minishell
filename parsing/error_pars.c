/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:27 by adregis           #+#    #+#             */
/*   Updated: 2025/06/27 11:09:43 by adregis          ###   ########.fr       */
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

void	manage_redir(char c, int j)
{
	if (c == '>')
	{
		if (j == 3)
			printf("minishell: syntax error near unexpected token `%s'\n",
				">");
		else
			printf("minishell: syntax error near unexpected token `%s'\n",
				">>");
	}
	else
	{
		if (j == 4)
			printf("minishell: syntax error near unexpected token `%s'\n",
				"<");
		else if (j == 5)
			printf("minishell: syntax error near unexpected token `%s'\n",
				"<<");
		else
			printf("minishell: syntax error near unexpected token `%s'\n",
				"<<<");
	}
}

int	ft_validate_redir(char c, int j, char **words, int i)
{
	if ((c == '>' && j >= 3) || (c == '<' && j >= 4))
	{
		manage_redir(c, j);
		return (0);
	}
	if (!words[i + 1])
	{
		printf("minishell: syntax error near unexpected token `newline'\n");
		return (0);
	}
	if (words[i + 1][0] == '>' || words[i + 1][0] == '<' ||
		words[i + 1][0] == '|')
	{
		printf("minishell: syntax error near unexpected token `%s'\n",
			words[i + 1]);
		return (0);
	}
	return (1);
}

int	ft_check_redir(char **words, int i)
{
	char	c;
	int		j;

	j = 0;
	c = words[i][0];
	while (words[i][j])
	{
		if (words[i][j] != c)
		{
			printf("minishell: syntax error near unexpected token `%s'\n",
				words[i]);
			return (0);
		}
		j++;
	}
	return (ft_validate_redir(c, j, words, i));
}

int	ft_parse_error(char **words)
{
	int	i;

	i = 0;
	while (words[i])
	{
		printf("DEBUG: words[%d] = '%s'\n", i, words[i]);
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
			printf("DEBUG: Found pipe at index %d\n", i);
			if (i == 0 || (i > 0 && words[i - 1][0] == '|'))
			{
				printf("minishell: syntax error near unexpected token `|'\n");
				global_exit_flag = 2;
				return (0);
			}
			if (!words[i + 1])
			{
				printf("minishell: syntax error near unexpected token `newline'\n");
				global_exit_flag = 2;
				return (0);
			}
		}
		i++;
	}
	return (1);
}
