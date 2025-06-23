/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:27 by adregis           #+#    #+#             */
/*   Updated: 2025/06/23 13:03:30 by adregis          ###   ########.fr       */
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

int	ft_parse_error(char **words)
{
	int	i;

	i = 0;
	while (words[i])
	{
		if (words[i][0] == '>' || words[i][0] == '<')
		{
			if (!words[i + 1])
				return (printf("minishell: syntax error near unexpected token `newline'\n"), 0);
			if (words[i + 1] && (words[i + 1][0] == '>' || words[i + 1][0] == '<'))
				return (printf("minishell: syntax error near unexpected token `%c'\n", words[i + 1][0]), 0);
		}
		i++;
	}
	return (1);
}

int	ft_check_advanced_syntax_str(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		// Gestion des chevrons droits (>)
		if (str[i] == '>')
		{
			if (str[i + 1] == '>' && str[i + 2] == '>' && str[i + 3] != '>')
			{
				printf("minishell: syntax error near unexpected token `>'\n");
				return (0);
			}
			else if (str[i + 1] == '>' && str[i + 2] == '>' && str[i + 3] == '>')
			{
				printf("minishell: syntax error near unexpected token `>>'\n");
				return (0);
			}
		}
		// Gestion des chevrons gauches (<)
		else if (str[i] == '<')
		{
			if (str[i + 1] == '<' && str[i + 2] == '<' && str[i + 3] == '<')
			{
				int count = 0;
				int j = 3;
				while (str[i + j] == '<')
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
		}
		// Gestion des pipes
		else if (str[i] == '|')
		{
			if (str[i + 1] == '|')
			{
				printf("minishell: syntax error near unexpected token `||'\n");
				return (0);
			}
		}
		i++;
	}
	return (1);
}
