/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_pars_2.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/01 12:28:51 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 12:29:12 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_pipe_error(char **words, int i)
{
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
	return (1);
}