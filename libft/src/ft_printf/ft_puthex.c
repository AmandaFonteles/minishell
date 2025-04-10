/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_puthex.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:38:19 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 11:57:10 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

static int	ft_convert_hex(unsigned int num, const char format)
{
	int	length;

	length = 0;
	if (num >= 16)
	{
		length += ft_convert_hex(num / 16, format);
		length += ft_convert_hex(num % 16, format);
	}
	else
	{
		if (num <= 9)
			length += ft_putchar(num + '0');
		else
		{
			if (format == 'x')
				length += ft_putchar(num - 10 + 'a');
			if (format == 'X')
				length += ft_putchar(num - 10 + 'A');
		}
	}
	return (length);
}

int	ft_puthex(unsigned int num, const char format)
{
	if (num == 0)
		return (write(1, "0", 1));
	else
		return (ft_convert_hex(num, format));
}
