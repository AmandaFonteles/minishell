/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   token_utils_5.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/07 09:52:46 by adregis           #+#    #+#             */
/*   Updated: 2025/06/07 09:52:47 by adregis          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/minishell.h"

void	set_next_type(t_token *current)
{
	if (!ft_strcmp(current->word, "<"))
		current->next->type = OPEN_FILE;
	else if (!ft_strcmp(current->word, "<<"))
		current->next->type = LIMITOR;
	else if (!ft_strcmp(current->word, ">"))
		current->next->type = EXIT_FILE;
	else if (!ft_strcmp(current->word, ">>"))
		current->next->type = EXIT_FILE_RET;
}

void	set_token_type(t_token *current)
{
	if (!ft_strcmp(current->word, "<"))
		current->type = FILE_IN;
	else if (!ft_strcmp(current->word, "<<"))
		current->type = HERE_DOC;
	else if (!ft_strcmp(current->word, ">"))
		current->type = FILE_OUT;
	else if (!ft_strcmp(current->word, ">>"))
		current->type = FILE_OUT_SUR;
	else if (!current->type)
		current->type = ARG;
	if (current->next && current->type != ARG)
		set_next_type(current);
}

int	ft_set_type(t_token **token)
{
	t_token	*current;

	current = (*token);
	while (current)
	{
		set_token_type(current);
		current = current->next;
	}
	return (1);
}


