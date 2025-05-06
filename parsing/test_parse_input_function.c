// #include "../inc/minishell.h"

// t_pars_cmd	**parse_input(char *str)
// {
// 	char		**tab;
// 	t_pars_cmd	**cmds;
// 	int			i;
// 	t_pars_cmd	*cmd;

// 	printf("\n=== parse_input: '%s' ===\n", str);
// 	i = 1;
// 	cmds = ft_calloc(1, sizeof(t_pars_cmd *));
// 	if (!cmds)
// 	{
// 		printf("1. ft_calloc failed for cmds\n");
// 		return (NULL);
// 	}
// 	printf("1. cmds allocated\n");

// 	if (!ft_check(str, 0, 0, 0))
// 	{
// 		printf("2. ft_check failed\n");
// 		return (free_cmd_node(*cmds), NULL);
// 	}
// 	printf("2. ft_check passed\n");

// 	tab = ft_shell_split(str, '|', 0, 0);
// 	if (!tab)
// 	{
// 		printf("3. ft_shell_split failed\n");
// 		return (NULL);
// 	}
// 	printf("3. ft_shell_split successful\n");

// 	*cmds = ft_lstnew_cmd(tab[0], 0);
// 	if (*cmds == NULL)
// 	{
// 		printf("4. ft_lstnew_cmd failed for first command\n");
// 		return (free(tab), NULL);
// 	}
// 	printf("4. First command created\n");

// 	while (tab[i])
// 	{
// 		cmd = ft_lstnew_cmd(tab[i], i);
// 		if (!cmd)
// 		{
// 			printf("5. ft_lstnew_cmd failed for command %d\n", i);
// 			return (NULL);
// 		}
// 		ft_shell_add_back(cmds, cmd);
// 		printf("5. Command %d added\n", i);
// 		i++;
// 	}
// 	free(tab);
// 	printf("6. parse_input completed successfully\n");
// 	return (cmds);
// }
