/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:36:43 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 10:55:48 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"
#include "../../inc/ft_printf.h"

static int	check_specifier(const char specifier, va_list ptr_args)
{
	if (specifier == 'c')
		return (ft_putchar(va_arg(ptr_args, int)));
	else if (specifier == 's')
		return (ft_putstr(va_arg(ptr_args, char *)));
	else if (specifier == 'p')
		return (ft_putaddress(va_arg(ptr_args, void *)));
	else if (specifier == 'd' || specifier == 'i')
		return (ft_putnbr(va_arg(ptr_args, int)));
	else if (specifier == 'u')
		return (ft_putunsigned(va_arg(ptr_args, unsigned int)));
	else if (specifier == 'x' || specifier == 'X')
		return (ft_puthex(va_arg(ptr_args, unsigned int), specifier));
	return (-1);
}

int	ft_printf(const char *str, ...)
{
	va_list	ptr_args;
	int		length;

	length = 0;
	va_start(ptr_args, str);
	while (*str)
	{
		if (*str == '%' && ft_strchr("cspdiuxX", *(++str)))
			length += check_specifier(*(str), ptr_args);
		else
			length += write(1, str, 1);
		str++;
	}
	va_end(ptr_args);
	return (length);
}
