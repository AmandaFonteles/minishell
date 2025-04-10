/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:38:41 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 12:05:25 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

static int	recursive_putnbr(unsigned int n)
{
	int	length;

	length = 0;
	if (n >= 10)
		length += recursive_putnbr(n / 10);
	length += ft_putchar((n % 10) + '0');
	return (length);
}

int	ft_putnbr(int n)
{
	int	length;

	length = 0;
	if (n < 0)
	{
		length += ft_putchar('-');
		length += recursive_putnbr(-((unsigned int)n));
	}
	else
		length += recursive_putnbr(n);
	return (length);
}
