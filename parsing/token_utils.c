/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   token_utils.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:50 by adregis           #+#    #+#             */
/*   Updated: 2025/06/27 11:14:16 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/token.h"

int	skip_spaces(char *str, int i)
{
	while (str[i] && str[i] == ' ')
		i++;
	return (i);
}

int	nb_words(char *str)
{
	int	i;
	int	nw;
	int	d;
	int	s;

	i = 0;
	nw = 0;
	d = 0;
	s = 0;
	printf("DEBUG nb_words: str='%s'\n", str);
	while (str[i])
	{
		printf("DEBUG nb_words: i=%d, str[i]='%c', nw=%d\n", i, str[i], nw);
		i = skip_spaces(str, i);
		if (str[i] && str[i] != '<' && str[i] != '>' && str[i] != '|' && (!(d % 2) && !(s % 2)))
		{
			nw++;
			printf("DEBUG nb_words: Added word token, nw=%d\n", nw);
		}
		while (str[i] && str[i] != ' ' && str[i] != '>' && str[i] != '<' && str[i] != '|')
		{
			i = update_quotes(str, i, &d, &s);
			i++;
		}
		if (str[i] == '<' || str[i] == '>' || str[i] == '|')
		{
			nw++;
			printf("DEBUG nb_words: Added operator token '%c', nw=%d\n", str[i], nw);
		}
		while (str[i] == '<' || str[i] == '>')
			i++;
		if (str[i] == '|')
			i++;
	}
	printf("DEBUG nb_words: Final count = %d\n", nw);
	return (nw);
}

int	calculate_token_len(char *str, int d, int s)
{
	int	len;

	len = 0;
	while (str[len] && str[len] != ' ' && str[len] != '>' && str[len] != '<' && str[len] != '|')
	{
		if (str[len] == 34 && (s % 2 == 0))
			(d)++;
		if (str[len] == 39 && (d % 2 == 0))
			(s)++;
		while (str[len] && ((d % 2) || (s % 2)))
		{
			len++;
			if (str[len] == 34 && (s % 2 == 0))
				(d)++;
			if (str[len] == 39 && (d % 2 == 0))
				(s)++;
		}
		len++;
	}
	return (len);
}

int	ft_create_word(char *str, char **tab, int i)
{
	int	len;
	int	j;
	int	d;
	int	s;

	d = 0;
	s = 0;
	j = 0;
	if (*str == '<' || *str == '>')
	{
		while (str[j] && (str[j] == '<' || str[j] == '>'))
			j++;
		len = j;
	}
	else if (*str == '|')
	{
		len = 1;
	}
	else
		len = calculate_token_len(str, d, s);
	tab[i] = ft_calloc(len + 1, sizeof(char));
	j = 0;
	while (j < len)
	{
		tab[i][j] = str[j];
		j++;
	}
	tab[i][j] = '\0';
	return (len);
}

char	**ft_split_token(char *str)
{
	char	**tab;
	int		i;
	int		j;
	int		d;
	int		s;

	i = 0;
	j = 0;
	d = 0;
	s = 0;
	printf("DEBUG: nb_words = %d\n", nb_words(str));
	tab = ft_calloc(nb_words(str) + 1, sizeof(char *));
	while (str[i])
	{
		printf("DEBUG: i=%d, str[i]='%c'\n", i, str[i]);
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		while (str[i] && str[i] == ' ')
			i++;
		if (str[i])
		{
			printf("DEBUG: Creating token %d at position %d\n", j, i);
			i += ft_create_word(&str[i], tab, j++);
			printf("DEBUG: After creating token, i=%d\n", i);
		}
	}
	tab[j] = NULL;
	printf("DEBUG: Created %d tokens\n", j);
	return (tab);
}
