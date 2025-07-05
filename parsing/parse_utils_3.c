/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse_utils_3.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/01 14:56:39 by adregis           #+#    #+#             */
/*   Updated: 2025/07/04 17:09:30 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	pipe_error(char *msg)
{
	printf("minishell: syntax error near unexpected token `%s'\n", msg);
	g_exit_flag = 2;
	return (0);
}

int	check_single(char *str)
{
	if (str[0] == ':' || str[0] == '!')
	{
		if (str[1] == '\0')
		{
			return (0);
		}
	}
	return (1);
}

static int	handle_pipe_error(char *str, int i)
{
	int	j;

	if (str[i + 1] == '|')
		return (pipe_error("||"));
	j = i + 1;
	while (str[j] == ' ')
		j++;
	if (str[j] == '|')
		return (pipe_error("|"));
	return (1);
}

int	check_consecutive_pipes(char *str)
{
	int	i;
	int	d;
	int	s;

	i = 0;
	d = 0;
	s = 0;
	while (str[i])
	{
		if (str[i] == 34 && s % 2 == 0)
			d++;
		if (str[i] == 39 && d % 2 == 0)
			s++;
		if (str[i] == '|' && s % 2 == 0 && d % 2 == 0)
			if (!handle_pipe_error(str, i))
				return (0);
		i++;
	}
	return (1);
}
