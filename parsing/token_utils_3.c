/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   token_utils_3.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:36 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 09:52:38 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_isset(char c, const char *set)
{
	while (*set)
		if (c == *set++)
			return (1);
	return (0);
}

int	ft_check_dir(char *str)
{
	int	i;

	i = 0;
	while (str[i] && str[i] == str[0])
		i++;
	if (i >= 2 && str[2])
		return (printf("minishell: syntax error near unexpected token `%c'\n",
				str[2]),
			0);
	else if (str[1] && str[1] != str[0])
		return (printf("minishell: syntax error near unexpected token `%c'\n",
				str[1]),
			0);
	else
		return (1);
}
