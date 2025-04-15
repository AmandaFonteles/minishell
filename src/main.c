/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/05 17:01:52 by tautin--          #+#    #+#             */
/*   Updated: 2025/04/10 19:28:17 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/** DOCUMENTATION **
 * main.c: Initialization, input loop, and program entry.
 *      - initializes the minishell struct
 *      - loop:
 *         - promp for input
 *         - parse the input
 *         - lexes and validates syntax
 *         - exec cmg
 *         - wait for the command to finish
 *         - free memory
 */
#include "../inc/minishell.h"

// TODO: add free_cmd_list(), free_pipe_ends() here before reinitializing
//TODO: check if all the malloc from libft func was freed!!!
// TOO: Create a global variable to store the exit code
//loop that will keep the minishell running - return the prompt to user
void main_loop(t_minishell *data)
{
    while (1)
    {
        init_structs(data);
        data->user_input = readline("minishell$> ");
        if (!data->user_input)
        {
            printf("exit\n");
            break;
        }
        if (data->user_input[0] != '\0')
            add_history(data->user_input);
        //init_structs
        //parse the command
        //execute the command
        basic_parse_input(data);
        setup_exec(data);
        //wait for the command to finish
        free_all(data);
    }
}

int main(int ac, char **av, char **envp)
{
    (void)av;
    t_minishell *data;

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
    init_structs(data);
    init_env(data, envp);
    init_exp(data, envp);
    main_loop(data); 
    //free all the memory allocated
    return (data->exit_code);
}
