/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:27 by adregis           #+#    #+#             */
/*   Updated: 2025/06/23 15:32:53 by adregis          ###   ########.fr       */
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
	int	j;
	char c;

	i = 0;
	while (words[i])
	{
		c = words[i][0];
		if (c == '>' || c == '<')
		{
			// Vérifie que le token ne contient que des '<' ou que des '>'
			j = 1;
			while(words[i][j])
			{
				if (words[i][j] != c)
				{
					printf("minishell: syntax error near unexpected token `%s'\n", words[i]);
					rl_clear_history();
					return (0);
				}
				j++;
			}
			// Vérifie la longueur du token de redirection et affiche le bon message
			if (c == '>')
			{
				if (j == 1 || j == 2)
				{
					printf("minishell: syntax error near unexpected token `newline'\n");
					rl_clear_history();
					return (0);
				}
				else if (j == 3)
				{
					printf("minishell: syntax error near unexpected token `>'\n");
					rl_clear_history();
					return (0);
				}
				else if (j >= 4)
				{
					printf("minishell: syntax error near unexpected token `>>'\n");
					rl_clear_history();
					return (0);
				}
			}
			else if (c == '<')
			{
				if (j >= 1 && j <= 3)
				{
					printf("minishell: syntax error near unexpected token `newline'\n");
					rl_clear_history();
					return (0);
				}
				else if (j == 4)
				{
					printf("minishell: syntax error near unexpected token `<'\n");
					rl_clear_history();
					return (0);
				}
				else if (j == 5)
				{
					printf("minishell: syntax error near unexpected token `<<'\n");
					rl_clear_history();
					return (0);
				}
				else if (j >= 6)
				{
					printf("minishell: syntax error near unexpected token `<<<'\n");
					rl_clear_history();
					return (0);
				}
			}
			// Vérifie le token suivant la redirection
			if (!words[i + 1])
			{
				printf("minishell: syntax error near unexpected token `newline'\n");
				rl_clear_history();
				return (0);
			}
			if (words[i + 1][0] == '>' || words[i + 1][0] == '<' || words[i + 1][0] == '|')
			{
				printf("minishell: syntax error near unexpected token `%s'\n", words[i + 1]);
				rl_clear_history();
				return (0);
			}
		}
		// Gestion des pipes (si un token | est trouvé ici, c'est une erreur)
		else if (words[i][0] == '|')
		{
			printf("minishell: syntax error near unexpected token `|'\n");
			rl_clear_history();
			return (0);
		}
		i++;
	}
	return (1);
}

// int	ft_check_advanced_syntax_str(char *str)
// {
// 	int	i;

// 	i = 0;
// 	while (str[i])
// 	{
// 		// Gestion des chevrons droits (>)
// 		if (str[i] == '>')
// 		{
// 			if (str[i + 1] == '>' && str[i + 2] == '>' && str[i + 3] != '>')
// 			{
// 				printf("minishell: syntax error near unexpected token `>'\n");
// 				return (0);
// 			}
// 			else if (str[i + 1] == '>' && str[i + 2] == '>' && str[i + 3] == '>')
// 			{
// 				printf("minishell: syntax error near unexpected token `>>'\n");
// 				return (0);
// 			}
// 		}
// 		// Gestion des chevrons gauches (<)
// 		else if (str[i] == '<')
// 		{
// 			if (str[i + 1] == '<' && str[i + 2] == '<' && str[i + 3] == '<')
// 			{
// 				int count = 0;
// 				int j = 3;
// 				while (str[i + j] == '<')
// 				{
// 					count++;
// 					j++;
// 				}
// 				if (count == 1)
// 					printf("minishell: syntax error near unexpected token `<'\n");
// 				else if (count == 2)
// 					printf("minishell: syntax error near unexpected token `<<'\n");
// 				else
// 					printf("minishell: syntax error near unexpected token `<<<'\n");
// 				return (0);
// 			}
// 		}
// 		// Gestion des pipes
// 		else if (str[i] == '|')
// 		{
// 			if (str[i + 1] == '|')
// 			{
// 				printf("minishell: syntax error near unexpected token `||'\n");
// 				return (0);
// 			}
// 		}
// 		i++;
// 	}
// 	return (1);
// }
