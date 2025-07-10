/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   signals.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/06 08:52:34 by adregis           #+#    #+#             */
/*   Updated: 2025/07/10 11:19:34 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	ft_signal(int sig)
{
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
	if (sig == SIGINT)
	{
		g_exit_flag = 130;
		write(1, "\n", 1);
		rl_on_new_line();
		rl_replace_line("", 0);
	}
}

void	ft_handle_heredoc_signal(int sig)
{
	if (sig == SIGINT)
	{
		g_exit_flag = 130;
		write(1, "\n", 1);
		rl_on_new_line();
		rl_replace_line("", 0);
	}
}

void	set_heredoc_signals(void)
{
	signal(SIGINT, ft_handle_heredoc_signal);
	signal(SIGQUIT, SIG_IGN);
}

void	reset_heredoc_signals(void)
{
	signal(SIGINT, SIG_DFL);
	signal(SIGQUIT, SIG_DFL);
}
