/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/18 18:18:08 by afontele          #+#    #+#             */
/*   Updated: 2025/07/09 14:35:09 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	isnbr(char *str)
{
	int	i;

	i = 0;
	if (!str || !str[0])
		return (0);
	if (str[i] == '-' || str[i] == '+')
		i++;
	if (str[i] == '\0')
		return (0);
	while (str[i])
	{
		if (str[i] < '0' || str[i] > '9')
			return (0);
		i++;
	}
	return (1);
}

static int	get_sig(const char **str)
{
	int	sig;

	sig = 1;
	if (**str == '-')
	{
		sig = -1;
		(*str)++;
	}
	else if (**str == '+')
		(*str)++;
	return (sig);
}

static long long	get_overflow(int sig, int *overflow)
{
	*overflow = 1;
	if (sig == 1)
		return (LLONG_MAX);
	return (LLONG_MIN);
}

long long	modif_atoll(const char *str, int *overflow)
{
	unsigned long long	resul;
	unsigned long long	limit;
	int					sig;
	unsigned int		j;

	resul = 0;
	sig = get_sig(&str);
	*overflow = 0;
	if (sig == 1)
		limit = LLONG_MAX;
	else
		limit = (unsigned long long)LLONG_MAX + 1;
	while (*str && *str >= '0' && *str <= '9')
	{
		j = *str - '0';
		if (resul > limit / 10 || (resul == limit / 10 && j > limit % 10))
			return (get_overflow(sig, overflow));
		resul = resul * 10 + j;
		str++;
	}
	if (sig == 1)
		return ((long long)resul);
	return ((long long)(-resul));
}

int	get_exit_code(char *str, long long *value)
{
	int	overflow;

	if (!isnbr(str))
		return (0);
	*value = modif_atoll(str, &overflow);
	if (overflow)
		return (0);
	return (1);
}
