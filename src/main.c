/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/05 17:01:52 by intaut--          #+#    #+#             */
/*   Updated: 2025/07/09 23:22:05 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

int	g_exit_flag = 0;

void	main_loop(t_minishell *data)
{
	while (1)
	{
		init_structs(data);
		signal(SIGQUIT, SIG_IGN);
		signal(SIGINT, ft_signal);
		data->user_input = readline("minishell$> ");
		if (!data->user_input)
		{
			printf("exit\n");
			break ;
		}
		if (data->user_input[0] != '\0')
			add_history(data->user_input);
		process_input(data);
		setup_exec(data);
		free_all(data);
	}
}

int	main(int ac, char **av, char **envp)
{
	t_minishell	*data;

	g_exit_flag = 0;
	(void)av;
	if (ac != 1)
	{
		ft_putstr_fd("Error: minishell don't take arguments\n", 2);
		return (1);
	}
	data = malloc(sizeof(t_minishell));
	if (!data)
	{
		ft_putstr_fd("Error: malloc failed\n", 2);
		return (1);
	}
	if (!init_data(data, envp))
		return (1);
	main_loop(data);
	free_to_exit(data);
	return (g_exit_flag);
}
