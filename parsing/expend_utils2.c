/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   expend_utils2.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:48 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 15:13:30 by adregis          ###   ########.fr       */
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

int	ft_handle_double_quote(char **str, char *tmp, t_minishell *data)
{
	tmp = ft_expend_d(ft_strtrim(*str, "\""), 0, -1, data);
	free(*str);
	*str = tmp;
	return (1);
}

int	ft_handle_single_quote(char **str, char *tmp)
{
	tmp = ft_strtrim(*str, "\'");
	free(*str);
	*str = tmp;
	return (1);
}

int	ft_handle_dollar(char **str, char *tmp, char *var_value)
{
	if (!(*str)[1])
		tmp = ft_strdup("$");
	else if ((*str)[1] == '?')
		tmp = ft_itoa(global_exit_flag);
	else
	{
		if (var_value)
			tmp = ft_strdup(var_value);
		else
			tmp = ft_strdup("");
	}
	free(*str);
	*str = tmp;
	return (1);
}
