/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   expend_utils_3.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/01 14:38:16 by adregis           #+#    #+#             */
/*   Updated: 2025/07/01 15:13:00 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	ft_fill_tab(char *str, char **tab, t_minishell *data, char *tmp)
{
	int	i;
	int	j;

	i = 0;
	j = -1;
	while (str[i])
	{
		i += ft_create_str(&str[i], &tab[++j]);
		if (!i)
		{
			ft_free_tab(tab, 0);
			return (0);
		}
		ft_get_value(&tab[j], tmp, data);
	}
	if (tab[j])
		j++;
	return (j);
}
