/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   expend_utils.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:51:43 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 14:31:11 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_get_value(char **str, char *tmp, t_minishell *data)
{
	char	*var_name;
	char	*var_value;

	var_name = *str + 1;
	var_value = white_get_env(var_name, data);
	if ((*str)[0] == 34)
		return (ft_handle_double_quote(str, tmp, data));
	if ((*str)[0] == 39)
		return (ft_handle_single_quote(str, tmp));
	if ((*str)[0] == '$')
		return (ft_handle_dollar(str, tmp, var_value));
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
