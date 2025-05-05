#include "../inc/minishell.h"

int	ft_expend_isalnum(char c)
{
	if (ft_isalnum(c) || c == '_')
		return (1);
	return (0);
}
