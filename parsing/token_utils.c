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
	while (str[i])
	{
		i = skip_spaces(str, i);
		if (str[i] && str[i] != '<' && str[i] != '>' && (!(d % 2) && !(s % 2)))
			nw++;
		while (str[i] && str[i] != ' ' && str[i] != '>' && str[i] != '<')
		{
			i = update_quotes(str, i, &d, &s);
			i++;
		}
		if (str[i] == '<' || str[i] == '>')
			nw++;
		while (str[i] == '<' || str[i] == '>')
			i++;
	}
	return (nw);
}

int	calculate_token_len(char *str, int d, int s)
{
	int	len;

	len = 0;
	while (str[len] && str[len] != ' ' && str[len] != '>' && str[len] != '<')
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
	tab = ft_calloc(nb_words(str) + 1, sizeof(char *));
	while (str[i])
	{
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		while (str[i] && str[i] == ' ')
			i++;
		if (str[i])
			i += ft_create_word(&str[i], tab, j++);
	}
	tab[j] = NULL;
	return (tab);
}
