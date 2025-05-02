/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adregis <adregis@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/05 17:01:52 by tautin--          #+#    #+#             */
/*   Updated: 2025/04/30 11:36:34 by adregis          ###   ########.fr       */
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

//TODO: check if all the malloc from libft func was freed!!!
int global_exit_flag;

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
        // basic_parse_input(data);
        process_input(data);
        setup_exec(data);
        free_all(data);
    }
}
//change nbr of returning errors for different errors
int main(int ac, char **av, char **envp)
{
    t_minishell *data;

    global_exit_status = 0;
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
    //free all the memory allocated
    return (global_exit_flag);
}
