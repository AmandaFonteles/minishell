/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   signals.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/06 08:52:34 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 11:03:19 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_signal(int sig)
{
	global_exit_flag += sig;
	if (sig == 2)
	{
		global_exit_flag = 130;
		write(1, "\n", 1);
		rl_on_new_line();
		rl_replace_line("", 0);
		rl_redisplay();
	}
	if (sig == SIGQUIT)
	{
		write(2, "Quit (core dumped)\n", 20);
		exit(1);
	}
}

void	ft_signal_cat(int sig)
{
	global_exit_flag += sig;
	if (sig == 2)
	{
		global_exit_flag = 130;
		exit(130);
	}
	if (sig == SIGQUIT)
	{
		write(2, "Quit (core dumped)\n", 20);
		exit(1);
	}
}

void    ft_handle_heredoc_signal(int sig)
{
    if (sig == SIGINT)
    {
        write(1, "\n", 1);
        rl_on_new_line();
        rl_replace_line("", 0);
        signal(SIGINT, SIG_DFL);  
        signal(SIGQUIT, SIG_DFL);
        exit(130);
    }
}
