#include "../inc/minishell.h"

int	ft_check(char *str, int i, int d, int s)
{
	while (str[i])
	{
		if (str[i] == '|' && !(s % 2) && !(d % 2))
		{
			i++;
			while (str[i] && str[i] == ' ')
				i++;
			if (!str[i] || str[i] == '|')
				return (printf("Minishell: syntax error near \
					unexpected token '|'\n"),
					0);
		}
		if (str[i] == 34 && (s % 2 == 0))
			d++;
		if (str[i] == 39 && (d % 2 == 0))
			s++;
		i++;
	}
	if ((s % 2) || (d % 2))
		return (printf("Invalid number of quotes\n"), 0);
	return (1);
}
