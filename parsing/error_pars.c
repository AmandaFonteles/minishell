#include "../inc/minishell.h"

void	ft_print_exit_free_all(t_pars_cmd **cmds)
{
	(void)cmds;
	printf("exit\n");
	ft_free_env(get_adress());
	exit(0);
}

int	ft_parse_error(char **words)
{
	int	i;

	i = 0;
	while (words[i])
	{
		if (words[i][0] == '>' || words[i][0] == '<' || words[i][0] == '&')
		
		{
			if (!ft_check_dir(words[i]))
				return (0);
			if (!words[i + 1])
				return (printf(
						"minishell: syntax error near unexpected \
						token `newline'\n"),
					0);
			if (words[i + 1] && (words[i + 1][0] == '>' || words[i
					+ 1][0] == '<'))
				return (printf("minishell: syntax error near unexpected\
						token `%c'\n",
						words[i + 1][0]),
						0);
		}
		i++;
	}
	return (1);
}
