/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putunsigned.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:39:41 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 12:09:32 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

int	ft_putunsigned(unsigned int n)
{
	int	counter;

	counter = 0;
	if (n == 0)
		return (ft_putchar('0'));
	else
	{
		if (n / 10 != 0)
			counter += ft_putunsigned(n / 10);
		counter += ft_putchar((n % 10) + '0');
		return (counter);
	}
}
