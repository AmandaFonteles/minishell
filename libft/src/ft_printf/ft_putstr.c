/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:39:05 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 12:07:14 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

int	ft_putstr(char *s)
{
	unsigned int	length;

	length = 0;
	if (!s)
	{
		write(1, "(null)", 6);
		return (6);
	}
	while (s[length])
	{
		write(1, &s[length], 1);
		length++;
	}
	return (length);
}
