/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free_parse_2.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/26 13:04:11 by adregis           #+#    #+#             */
/*   Updated: 2025/06/26 13:04:20 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_free_tab(char **tab, int nb)
{
	int	i;

	(void)nb;
	i = 0;
	while (tab && tab[i])
		free(tab[i++]);
	free(tab);
}
