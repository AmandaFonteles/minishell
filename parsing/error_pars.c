/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:27 by adregis           #+#    #+#             */
/*   Updated: 2025/06/20 16:06:05 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_print_exit_free_all(t_pars_cmd **cmds)
{
	(void)cmds;
	printf("exit\n");
	ft_free_env(get_adress());
	exit(0);
}

int	ft_parse_error(char **words)
{
	int	i;

	i = 0;
	while (words[i])
	{
		if (words[i][0] == '>')
		{
			if (words[i][1] == '>' && words[i][2] == '>' && !words[i][3])
			{
				printf("minishell: syntax error near unexpected token `>'\n");
				return (0);
<<<<<<< HEAD
			}
			else if (words[i][1] == '>' && words[i][2] == '>' && words[i][3] == '>')
			{
				printf("minishell: syntax error near unexpected token `>>'\n");
				return (0);
			}
			else if (!words[i][1] || (words[i][1] == '>' && !words[i][2]))
			{
				if (!words[i + 1])
					printf("minishell: syntax error near unexpected token `newline'\n");
				else if (words[i + 1][0] == '>' || words[i + 1][0] == '<')
					printf("minishell: syntax error near unexpected token `%c'\n", words[i + 1][0]);
				return (0);
			}
		}
		else if (words[i][0] == '<')
		{
			if (words[i][1] == '<' && words[i][2] == '<' && words[i][3] == '<')
			{
				int count = 0;
				int j = 3;
				while (words[i][j] == '<')
				{
					count++;
					j++;
				}
				if (count == 1)
					printf("minishell: syntax error near unexpected token `<'\n");
				else if (count == 2)
					printf("minishell: syntax error near unexpected token `<<'\n");
				else
					printf("minishell: syntax error near unexpected token `<<<'\n");
				return (0);
			}
			else if (!words[i][1] || (words[i][1] == '<' && !words[i][2]) || (words[i][1] == '<' && words[i][2] == '<' && !words[i][3]))
			{
				if (!words[i + 1])
					printf("minishell: syntax error near unexpected token `newline'\n");
				else if (words[i + 1][0] == '>' || words[i + 1][0] == '<')
					printf("minishell: syntax error near unexpected token `%c'\n", words[i + 1][0]);
				return (0);
			}
		}
		else if (words[i][0] == '|')
		{
			if (!words[i][1])
			{
				if (!words[i + 1])
					printf("minishell: syntax error near unexpected token `|'\n");
				else if (words[i + 1][0] == '|')
					printf("minishell: syntax error near unexpected token `||'\n");
				return (0);
			}
			else if (words[i][1] == '|')
			{
				printf("minishell: syntax error near unexpected token `||'\n");
				return (0);
			}
=======
			if (!words[i + 1])
				return (printf(
						"minishell: syntax error near unexpected token `newline'\n"), 0);
			if (words[i + 1] && (words[i + 1][0] == '>' || words[i
					+ 1][0] == '<'))
				return (printf("minishell: syntax error near unexpected token `%c'\n", words[i + 1][0]), 0);
>>>>>>> c90c57cb13c13ec5ea3bddd3cc3a54aabe8c910b
		}
		i++;
	}
	return (1);
}
