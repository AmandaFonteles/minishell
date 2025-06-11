/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   token_utils_2.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:31 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 09:52:33 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/token.h"

int	update_quotes(char *str, int i, int *d, int *s)
{
	if (str[i] == 34 && (*s % 2 == 0))
		(*d)++;
	if (str[i] == 39 && (*d % 2 == 0))
		(*s)++;
	while (str[i] && (*d % 2 || *s % 2))
	{
		i++;
		if (str[i] == 34 && (*s % 2 == 0))
			(*d)++;
		if (str[i] == 39 && (*d % 2 == 0))
			(*s)++;
	}
	return (i);
}

int	ft_count_space(char *str)
{
	int	i;
	int	nw;

	i = 0;
	nw = 0;
	while (str[i])
	{
		if (str[i++] == ' ')
			nw++;
	}
	return (nw + 1);
}

int	ft_count_args(t_pars_cmd *cmd)
{
	t_token	*cur;
	int		nb_words;

	cur = (*cmd->token);
	nb_words = 0;
	while (cur)
	{
		if (cur->word[0] != 34)
			nb_words += ft_count_space(cur->word);
		else
			nb_words++;
		cur = cur->next;
	}
	return (nb_words);
}

int	ft_split_word(char *str, char **args, int index)
{
	int		i;
	char	**tab;

	i = 0;
	tab = ft_split(str, ' ');
	if (!tab)
		return (-1);
	while (tab[i])
	{
		args[index] = ft_strdup(tab[i]);
		if (!args[index])
			return (-1);
		index++;
		i++;
	}
	ft_free_tab(tab, 0);
	return (i);
}

char	*dark_strtrim(const char *s1, const char *set)
{
	char	*ret;
	char	*start;
	char	*end;

	if (!s1 || !set)
		return (0);
	start = (char *)s1;
	end = start + ft_strlen(s1);
	if (*start && ft_isset(*start, set))
		++start;
	if (start < end && ft_isset(*(end - 1), set))
		--end;
	ret = ft_substr(start, 0, end - start);
	return (ret);
}
