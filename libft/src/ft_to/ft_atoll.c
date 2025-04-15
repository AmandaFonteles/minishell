/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoll.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/15 11:51:41 by afontele          #+#    #+#             */
/*   Updated: 2025/04/15 13:24:00 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

static int	get_sign(const char **str)
{
	int	sign;

	sign = 1;
	while (**str == ' ' || (**str >= 9 && **str <= 13))
		(*str)++;
	if (**str == '-' || **str == '+')
	{
		if (**str == '-')
			sign = -1;
		(*str)++;
	}
	return (sign);
}

long long	ft_atoll(const char *str)
{
	long long	res;
	int			sign;

	res = 0;
	sign = 1;
	sign = get_sign(&str);
	while (*str >= '0' && *str <= '9')
	{
		if (res > (LLONG_MAX - (*str - '0')) / 10)
		{
			if (sign == 1)
				return (LLONG_MAX);
			else
				return (LLONG_MIN);
		}
		res = res * 10 + (*str - '0');
		str++;
	}
	return (res * sign);
}
