/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:07 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 09:52:08 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

char	**ft_shell_split(char *str, char sep, int d, int s)
{
	int		i;
	int		j;
	char	**tab;

	i = 0;
	j = 0;
	tab = ft_calloc(ft_nb_word(str, sep) + 1, sizeof(char *));
	tab[j] = ft_shell_strdup(str, '|');
	if (!tab[j++])
		return (ft_free_tab(tab, 0), NULL);
	while (str[i])
	{
		handle_special_chars(str, &i, &d, &s);
		if (str[i] == sep && (!(d % 2) && !(s % 2)))
		{
			tab[j] = ft_shell_strdup(&str[i + 1], sep);
			if (!tab[j++])
				return (ft_free_tab(tab, 0), NULL);
		}
		i++;
	}
	return (tab);
}

char	*ft_shell_strdup(const char *str, char sep)
{
	char	*tab;
	int		len;
	int		i;
	int		s;
	int		d;

	i = 0;
	s = 0;
	d = 0;
	len = calculate_len_w(str, sep);
	tab = (char *)ft_calloc((len + 1), sizeof(char));
	if (!tab)
		return (NULL);
	while (str[i] && (!(str[i] == sep && (!(d % 2) && !(s % 2)))))
	{
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		tab[i] = str[i];
		i++;
	}
	tab[i] = '\0';
	return (tab);
}

void	handle_special_chars(char *str, int *i, int *d, int *s)
{
	if (str[*i] == 34 && (*s % 2 == 0))
		(*d)++;
	if (str[*i] == 39 && (*d % 2 == 0))
		(*s)++;
}

int	calculate_len_w(const char *str, char sep)
{
	int	len;
	int	s;
	int	d;

	len = 0;
	s = 0;
	d = 0;
	while (str[len] && (!(str[len] == sep && (!(d % 2) && !(s % 2)))))
	{
		if (str[len] == 34 && (s % 2 == 0))
			d++;
		if (str[len] == 39 && (d % 2 == 0))
			s++;
		len++;
	}
	return (len);
}

int	ft_nb_word(char *str, char c)
{
	int	nb;
	int	d;
	int	s;
	int	i;

	d = 0;
	s = 0;
	nb = 0;
	i = 0;
	while (str[i])
	{
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		if (str[i] == c && (!(d % 2) && !(s % 2)))
			nb++;
		i++;
	}
	return (nb + 1);
}
