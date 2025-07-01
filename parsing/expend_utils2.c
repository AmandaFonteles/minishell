/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   expend_utils2.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:48 by adregis           #+#    #+#             */
/*   Updated: 2025/06/26 13:02:14 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_expend_isalnum(char c)
{
	if (ft_isalnum(c) || c == '_')
		return (1);
	return (0);
}

int	ft_manage_quote(char *str, int i)
{
	char	c;

	c = str[i++];
	while (str[i] && str[i] != c)
		i++;
	return (++i);
}
