/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   syntax_check.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:20 by adregis           #+#    #+#             */
/*   Updated: 2025/06/23 15:51:09 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_check(char *str, int i, int d, int s)
{
	while (str[i])
	{
		if (str[i] == '|' && !(s % 2) && !(d % 2))
		{
			if (i == 0)
			{
				printf("minishell: syntax error near unexpected token '|'\n");
				rl_clear_history();
				return (0);
			}
			i++;
			while (str[i] && str[i] == ' ')
				i++;
			if (!str[i] || str[i] == '|')
			{
				if (str[i] == '|')
				{
					// Compter les pipes consécutifs
					int pipe_count = 2;
					while (str[i + pipe_count - 1] == '|')
						pipe_count++;
					if (pipe_count == 2)
						printf("minishell: syntax error near unexpected token '||'\n");
					else
						printf("minishell: syntax error near unexpected token '||'\n");
				}
				else
					printf("minishell: syntax error near unexpected token '|'\n");
				rl_clear_history();
				return (0);
			}
		}
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		i++;
	}
	if ((s % 2) || (d % 2))
	{
		printf("minishell: invalid number of quotes\n");
		rl_clear_history();
		return (0);
	}
	return (1);
}
