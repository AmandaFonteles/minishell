#include "../inc/minishell.h"

t_pars_cmd	**parse_input(char *str)
{
	char		**tab;
	t_pars_cmd	**cmds;
	int			i;
	t_pars_cmd	*cmd;

	i = 1;
	cmds = ft_calloc(1, sizeof(t_pars_cmd *));
	if (!cmds || !ft_check(str, 0, 0, 0))
		return (free_cmd_node(*cmds), NULL);
	tab = ft_shell_split(str, '|', 0, 0);
	if (!tab)
		return (NULL);
	*cmds = ft_lstnew_cmd(tab[0], cmds, 0);
	if (*cmds == NULL)
		return (free(tab), NULL);
	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i], cmds, i);
		if (!cmd)
			return (NULL);
		ft_shell_add_back(cmds, cmd);
		i++;
	}
	free(tab);
	return (cmds);
}

t_pars_cmd	*ft_lstnew_cmd(char *cmd, t_pars_cmd **cmds, int cmd_index)
{
	t_pars_cmd	*new;

	new = ft_calloc(1, sizeof(t_pars_cmd));
	if (!new)
		return (NULL);
	new->cmd = cmd;
	new->cmd_index = cmd_index;
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

t_pars_cmd	*ft_lstlast_cmds(t_pars_cmd *cmd)
{
	if (!cmd)
		return (NULL);
	while (cmd->next)
		cmd = cmd->next;
	return (cmd);
}

void	ft_shell_add_back(t_pars_cmd **cmds, t_pars_cmd *new)
{
	t_pars_cmd	*temp;

	temp = *cmds;
	temp = ft_lstlast_cmds(temp);
	if (!temp)
		*cmds = new;
	else
		temp->next = new;
}

int	process_input(t_minishell *data)
{
	t_pars_cmd	**cmds;

	cmds = NULL;
	if (data->user_input == NULL)
	{
		free_cmd_node(*cmds);
		return (1);
	}
	if (*data->user_input != '\0')
	{
		cmds = parse_input(data->user_input);
		if (cmds)
		{
			if (ft_tokenise(cmds))
			{
				//Temporairement commenté pour le test de parsing
				// global_exit_status = setup_exec(data);
				setup_exec(data);
        // il va falloir se poser la question de la variable globale ici
		}
		// free_cmd_node(*cmds);
	}
	else
		free(data->user_input);
  }
	return (data->exit_code);
}
