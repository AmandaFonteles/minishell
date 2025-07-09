/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   signals.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/06 08:52:34 by adregis           #+#    #+#             */
/*   Updated: 2025/07/09 08:54:32 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_signal(int sig)
{
/*	g_exit_flag += sig;
	if (sig == 2)
	{
		g_exit_flag = 130;
		write(1, "\n", 1);
		rl_on_new_line();
		rl_replace_line("", 0);
		rl_redisplay();
	}
	if (sig == SIGQUIT)
	{
		write(2, "Quit (core dumped)\n", 20);
		exit(1);
	}*/
    if (sig == SIGINT)
    {
        g_exit_flag = 130;
        write(1, "\n", 1);
        rl_on_new_line();
        rl_replace_line("", 0);
        rl_redisplay();
    }
}

void	ft_signal_cat(int sig)
{
	/*g_exit_flag += sig;
	if (sig == 2)
	{
		g_exit_flag = 130;
    write(1, "\n", 1);
		rl_on_new_line();
		rl_replace_line("", 0);

	}
	if (sig == SIGQUIT)
	{
		write(2, "Quit (core dumped)\n", 20);
		exit(1);
	}*/
    if (sig == SIGINT)
    {
        g_exit_flag = 130;
        write(1, "\n", 1);
        rl_on_new_line();
        rl_replace_line("", 0);
    }
}

void    ft_handle_heredoc_signal(int sig)
{
    if (sig == SIGINT)
    {
        g_exit_flag = 130;
        write(1, "\n", 1);
        rl_on_new_line();
        rl_replace_line("", 0);
        signal(SIGINT, SIG_DFL);
        signal(SIGQUIT, SIG_DFL);
        // Ne pas faire exit, laisser le programme continuer
    }
}
