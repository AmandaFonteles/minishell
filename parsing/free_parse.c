#include "../inc/minishell.h"

void	ft_free_tab(char **tab, int nb)
{
	int	i;

	(void)nb;
	i = 0;
	while (tab && tab[i])
		free(tab[i++]);
	free(tab);
}

void	ft_free_env(t_env **env)
{
	t_env	*cur;
	t_env	*tmp;

	cur = (*env);
	while (cur)
	{
		if (cur->title)
			free(cur->title);
		if (cur->value)
			free(cur->value);
		tmp = cur->next;
		free(cur);
		cur = tmp;
	}
}
