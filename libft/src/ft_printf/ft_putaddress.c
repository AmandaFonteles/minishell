/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putaddress.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:37:31 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 16:53:15 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

static void	ft_print_hex(unsigned long nbr)
{
	if (nbr >= 16)
	{
		ft_print_hex(nbr / 16);
		ft_print_hex(nbr % 16);
	}
	else
	{
		if (nbr <= 9)
			ft_putchar(nbr + '0');
		else
			ft_putchar(nbr - 10 + 'a');
	}
}

int	ft_putaddress(void *ptr)
{
	int				length;
	unsigned long	address;

	address = (unsigned long)ptr;
	length = 2;
	if (address == 0)
	{
		write(1, "(nil)", 5);
		return (length + 3);
	}
	else
	{
		write(1, "0x", 2);
		ft_print_hex(address);
		while (address)
		{
			length++;
			address /= 16;
		}
	}
	return (length);
}
