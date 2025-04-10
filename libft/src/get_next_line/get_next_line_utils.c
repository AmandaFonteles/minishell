/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/09 00:44:07 by afontele          #+#    #+#             */
/*   Updated: 2024/04/09 00:44:07 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/* 
*	FT_GET_LINE
*	-----------
*	Extracts the line from the static variable.
*	The function returns a line read from fd ending in \n + \0.
*	OBS: str_line = (char *)malloc(sizeof(char) * (i + 2)) - it's +2 
*	because we need to include \n + \0.
*
*	FT_REMAINING_AFTER_NEWLINE
*	--------------------------
*	Stores in the static variable what's left of 
*	the storage after the extraction of the line.
*	Returns the static variable updated, ready to be 
*	used in the next call of get_next_line.
*
*	FT_STRCHR - The strchr() function returns a pointer 
*	to the first occurrence of the character c in the string s.
*	FT_STRJOIN - Allocates (with malloc(3)) and returns 
*	a new string, which is the str of the concatenation of ’s1’ and ’s2’.
*/
#include "../../inc/get_next_line.h"
#include "../../inc/libft.h"

char	*ft_get_line(char *storage)
{
	int		i;
	char	*str_line;

	i = 0;
	if (!storage[i])
		return (NULL);
	while (storage[i] != '\0' && storage[i] != '\n')
		i++;
	str_line = (char *)malloc(sizeof(char) * (i + 2));
	if (!str_line)
		return (NULL);
	i = 0;
	while (storage[i] != '\0' && storage[i] != '\n')
	{
		str_line[i] = storage[i];
		i++;
	}
	if (storage[i] == '\n')
	{
		str_line[i] = storage[i];
		i++;
	}
	str_line[i] = '\0';
	return (str_line);
}

char	*ft_remaining_after_newline(char *storage)
{
	int		i;
	int		j;
	char	*new_storage;

	i = 0;
	while (storage[i] != '\0' && storage[i] != '\n')
		i++;
	if (!storage[i])
	{
		free(storage);
		return (NULL);
	}
	new_storage = (char *)malloc(sizeof(char) * (ft_strlen(storage) - i + 1));
	if (!new_storage)
		return (NULL);
	i++;
	j = 0;
	while (storage[i] != '\0')
		new_storage[j++] = storage[i++];
	new_storage[j] = '\0';
	free(storage);
	return (new_storage);
}

char	*ft_strjoin_gnl(char *storage, char *buffer)
{
	char	*str;
	size_t	i;
	size_t	j;

	if (!storage)
	{
		storage = (char *)malloc(sizeof(char) * 1);
		storage[0] = '\0';
	}
	if (!storage || !buffer)
		return (NULL);
	str = malloc(sizeof(char) * ((ft_strlen(storage) + ft_strlen(buffer)) + 1));
	if (!str)
		return (NULL);
	i = -1;
	j = 0;
	if (storage)
		while (storage[++i] != '\0')
			str[i] = storage[i];
	while (buffer[j] != '\0')
		str[i++] = buffer[j++];
	str[ft_strlen(storage) + ft_strlen(buffer)] = '\0';
	free(storage);
	return (str);
}
