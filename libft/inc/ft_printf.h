/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/07 10:37:08 by afontele          #+#    #+#             */
/*   Updated: 2024/02/07 10:57:19 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <unistd.h>
# include <stdlib.h>

int	ft_printf(const char *str, ...);
int	ft_putaddress(void *ptr);
int	ft_putchar(char c);
int	ft_puthex(unsigned int num, const char format);
int	ft_putnbr(int n);
int	ft_putstr(char *s);
int	ft_putunsigned(unsigned int n);

#endif
