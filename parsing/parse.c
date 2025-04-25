#include "../inc/minishell.h"

t_pars_cmd	**parse_input(char *str)
{
	char	**tab;
	t_pars_cmd	**cmds;
	int		i;
	t_pars_cmd	*cmd;

	i = 1;
	cmds = ft_calloc(1, sizeof(t_pars_cmd **));
	if (!cmds || !ft_check(str, 0, 0, 0))
		return (free_cmd_node(cmds), NULL);
	tab = ft_shell_split(str, '|', 0, 0);
	free(str);
	if (!tab)
		return (NULL);
	*cmds = ft_lstnew_cmd(tab[0], cmds, 0);
	if (*cmds == NULL)
		return (free(tab), NULL);
	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i++], cmds, i);
		if (!cmd)
			return (NULL);
		ft_darkadd_back(cmds, cmd);
	}
	free(tab);
	return (cmds);
}

int	process_input(t_minishell *data)
{
	t_pars_cmd	**cmds;

	cmds = NULL;
	if (data->user_input == NULL)
		//voir tes methodes pour free (je ne sais pas si tu as déjà quelque chose)
	if (*data->user_input != '\0')
	{
		cmds = parse_input(data->user_input);
		if (cmds)
		{
			if (ft_tokenise(cmds))
			  data->exit_code = setup_exec(data);
        // il va surement falloir faire une variable globale pour le exit code
		}
		free_cmd_node(cmds);
	}
	else
		free(data->user_input);
	return (data->exit_code);
}

t_pars_cmd	*ft_lstnew_cmd(char *cmd, t_pars_cmd **cmds, int cmd_index)
{
	t_pars_cmd	*new;

	new = ft_calloc(1, sizeof(t_pars_cmd));
	if (!new)
		return (NULL);
	new->cmd_index = cmd_index - 1;
	new->pid = 0;
	new->hd_nb = 0;
	new->heredoc = NULL;
	new->delimiters = NULL;
	new->infile = NULL;
	new->outfile = NULL;
	new->append = 0;
	new->args = NULL;
	new->next = NULL;
	return (new);
}
