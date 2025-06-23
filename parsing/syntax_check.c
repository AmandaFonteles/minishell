/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   syntax_check.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:20 by adregis           #+#    #+#             */
/*   Updated: 2025/06/23 18:39:19 by afontele         ###   ########.fr       */
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
				global_exit_flag = 2;
				return (0);
			}
			i++;
			while (str[i] && str[i] == ' ')
				i++;
			if (!str[i])
			{
				printf("minishell: syntax error near unexpected token '|'\n");
				global_exit_flag = 2;
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
		global_exit_flag = 2;
		return (0);
	}
	return (1);
}
