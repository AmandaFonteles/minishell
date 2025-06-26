/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   syntax_check.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:20 by adregis           #+#    #+#             */
/*   Updated: 2025/06/26 13:22:51 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	print_check_error(void)
{
	printf("minishell: syntax error near unexpected token '|'\n");
	global_exit_flag = 2;
}

void	print_quote_error(void)
{
	printf("minishell: invalid number of quotes\n");
	global_exit_flag = 2;
}

static int	check_pipe(char *str, int *i, int s, int d)
{
	if (str[*i] == '|' && !(s % 2) && !(d % 2))
	{
		if (*i == 0)
		{
			print_check_error();
			return (0);
		}
		(*i)++;
		while (str[*i] && str[*i] == ' ')
			(*i)++;
		if (!str[*i])
		{
			print_check_error();
			return (0);
		}
	}
	return (1);
}

int	ft_check(char *str, int i, int d, int s)
{
	while (str[i])
	{
		if (!check_pipe(str, &i, s, d))
			return (0);
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		i++;
	}
	if ((s % 2) || (d % 2))
	{
		print_quote_error();
		return (0);
	}
	return (1);
}
