/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/08 16:59:02 by afontele          #+#    #+#             */
/*   Updated: 2024/04/12 15:18:16 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/*
*	FT_READ_AND_STORE
*	-----------------
*	Use the read function to read from a fd to a buffer.
*	Then use ft_strjoint to append what was read to 
*	the static variable (storage), which may already contain previosly data. 
*	The function returns the updated static variable.
*	OBS: bytes_read = 1; Initializes to 1 because we can't initialize to 0.
*	It needs to enter the loop after the initialization.
* 
*	GET_NEXT_LINE
*	-------------
*	This function takes an opened file descriptor and returns its next line.
*	Static char storage - used to save the chars read from the fd and saved
*	into the buf. We will use storage to save the chars between function calls
*/
#include "../../inc/get_next_line.h"
#include "../../inc/libft.h"

char	*ft_read_and_store(int fd, char *storage)
{
	char	*buffer;
	int		bytes_read;

	buffer = malloc((BUFFER_SIZE + 1) * sizeof(char));
	if (!buffer)
		return (NULL);
	bytes_read = 1;
	while (!ft_strchr(storage, '\n') && bytes_read != 0)
	{
		bytes_read = read(fd, buffer, BUFFER_SIZE);
		if (bytes_read == -1)
		{
			free(buffer);
			return (NULL);
		}
		buffer[bytes_read] = '\0';
		storage = ft_strjoin_gnl(storage, buffer);
	}
	free(buffer);
	return (storage);
}

char	*get_next_line(int fd)
{
	char			*line;
	static char		*storage;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (NULL);
	storage = ft_read_and_store(fd, storage);
	if (!storage)
		return (NULL);
	line = ft_get_line(storage);
	storage = ft_remaining_after_newline(storage);
	if (!storage || !*storage)
	{
		free(storage);
		storage = NULL;
	}
	return (line);
}

/*int main(void)
{
	char	*line;
	int	fd1;
	int	fd2;
	int	fd3;

	fd1 = open("tests/test1.txt", O_RDONLY);
	fd2 = open("tests/test2.txt", O_RDONLY);
	fd3 = open("tests/test3.txt", O_RDONLY);

	if (fd1 == -1 || fd2 == -1 || fd3 == -1)
	{
		printf("Error opening file");
		return (1);
	}

	printf("Reading from test1.txt:\n");
	while((line = get_next_line(fd1)) != NULL)
	{
		printf("%s", line);
		free(line);
	}

	printf("Reading from test2.txt:\n");
        while((line = get_next_line(fd2)) != NULL)
        {
                printf("%s", line);
                free(line);
        }

	printf("Reading from test3.txt:\n");
        while((line = get_next_line(fd3)) != NULL)
        {
                printf("%s", line);
                free(line);
        }

	close(fd1);
	close(fd2);
	close(fd3);
	return (0);
}*/
