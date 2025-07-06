/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   signals.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/06 08:52:34 by adregis           #+#    #+#             */
/*   Updated: 2025/07/06 16:34:33 by adregis          ###   ########.fr       */
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
	// SIGQUIT est ignoré dans la boucle principale (SIG_IGN)
	// donc cette fonction ne devrait jamais être appelée pour SIGQUIT
}

void	ft_signal_cat(int sig)
{
	global_exit_flag += sig;
	if (sig == 2)
	{
		global_exit_flag = 130;
		write(1, "\n", 1);
		// Pas de rl_redisplay() pour les processus enfants
	}
	if (sig == SIGQUIT)
	{
		write(2, "Quit (core dumped)\n", 20);
		exit(131);
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
