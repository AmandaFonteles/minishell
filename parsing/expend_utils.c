/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   expend_utils.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:43 by adregis           #+#    #+#             */
/*   Updated: 2025/06/08 09:52:42 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_get_value(char **str, char *tmp, t_minishell *data)
{
	if ((*str)[0] == 34)  // Double quotes
	{
		tmp = ft_expend_d(ft_strtrim((*str), "\""), 0, -1, data);
		free(*str);
		(*str) = tmp;
	}
	else if ((*str)[0] == 39)  // Single quotes
	{
		tmp = ft_strtrim((*str), "\'");
		free(*str);
		(*str) = tmp;
	}
	else if ((*str) && (*str)[0] == '$')  // Variable
	{
		if (!(*str)[1])
			tmp = ft_strdup("$");
		else if ((*str)[1] && (*str)[1] == '?')
			tmp = ft_itoa(global_exit_flag);
		else
		{
			char *var_name = *str + 1;
			char *var_value = white_get_env(var_name, data);
			tmp = var_value ? ft_strdup(var_value) : ft_strdup("");
		}
		free(*str);
		(*str) = tmp;
	}
	return (1);
}

int	ft_check_dollars(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		if (str[i] == '$')
			return (1);
		i++;
	}
	return (0);
}

char	*ft_quote_value(char *str)
{
	char	*tmp;
	char	*res;

	if (!str)
		return ("");
	tmp = ft_strjoin("\"", str);
	if (!tmp)
		return (NULL);
	res = ft_strjoin(tmp, "\"");
	free(tmp);
	free(str);
	return (res);
}

char	*ft_join_parts(char **tab, int len_tab)
{
	int		len;
	int		i;
	int		j;
	char	*str;

	i = 0;
	len = 0;
	while (i < len_tab)
	{
		len += ft_strlen(tab[i++]);
	}
	str = ft_calloc((len + 1), sizeof(char));
	i = 0;
	j = 0;
	while (j < len_tab)
	{
		len = ft_strlen(tab[j]) + 1;
		if (len != 1)
		{
			ft_strlcat(str, tab[j], ft_strlen(str) + len);
			i += len;
		}
		j++;
	}
	return (str);
}

int	ft_create_str(char *str, char **part)
{
	int	i;

	i = find_stop_index(str, 0);
	*part = ft_create_part(str, i);
	if (!(*part))
		return (0);
	return (i);
}
