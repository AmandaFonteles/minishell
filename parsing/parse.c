#include "../inc/minishell.h"

t_pars_cmd	**parse_input(char *str)
{
	char		**tab;
	t_pars_cmd	**cmds;
	int			i;
	t_pars_cmd	*cmd;

	printf("\n=== parse_input: '%s' ===\n", str);
	i = 1;
	cmds = ft_calloc(1, sizeof(t_pars_cmd *));
	if (!cmds)
	{
		printf("1. ft_calloc failed for cmds\n");
		return (NULL);
	}
	printf("1. cmds allocated\n");

	if (!ft_check(str, 0, 0, 0))
	{
		printf("2. ft_check failed\n");
		return (free_cmd_node(*cmds), NULL);
	}
	printf("2. ft_check passed\n");

	tab = ft_shell_split(str, '|', 0, 0);
	if (!tab)
	{
		printf("3. ft_shell_split failed\n");
		return (NULL);
	}
	printf("3. ft_shell_split successful\n");

	*cmds = ft_lstnew_cmd(tab[0], 0);
	if (*cmds == NULL)
	{
		printf("4. ft_lstnew_cmd failed for first command\n");
		return (free(tab), NULL);
	}
	printf("4. First command created\n");

	while (tab[i])
	{
		cmd = ft_lstnew_cmd(tab[i], i);
		if (!cmd)
		{
			printf("5. ft_lstnew_cmd failed for command %d\n", i);
			return (NULL);
		}
		ft_shell_add_back(cmds, cmd);
		printf("5. Command %d added\n", i);
		i++;
	}
	free(tab);
	printf("6. parse_input completed successfully\n");
	return (cmds);
}

t_pars_cmd	*ft_lstnew_cmd(char *cmd, int cmd_index)
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
				if (data->cmd_list)
					free_cmd_node(data->cmd_list);
				data->cmd_list = *cmds;
				// setup_exec(data);
			}
			else
				free_cmd_node(*cmds);
		}
	}
	else
		free(data->user_input);
	return (global_exit_flag);
}
