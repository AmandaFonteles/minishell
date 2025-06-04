/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afontele <afontele@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/05 17:01:52 by tautin--          #+#    #+#             */
/*   Updated: 2025/06/04 18:23:52 by afontele         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/** DOCUMENTATION **
 * main.c: Initialization, input loop, and program entry.
 *      - initializes the minishell struct
 *      - loop:
 *         - prompt for input
 *         - parse the input
 *         - lexes and validates syntax
 *         - exec cmd
 *         - wait for the command to finish
 *         - free memory
 */
#include "../inc/minishell.h"

//TODO: check if all the malloc from libft func was freed!!!
//int global_exit_flag;

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
        // Debug print avant l'exécution (if needed for debug)
        // t_pars_cmd *cur = data->cmd_list;
        // while (cur)
        // {
        //     debug_print_cmd(cur);
        //     cur = cur->next;
        // }
        setup_exec(data);
        ft_free_cmds_lst(&data->cmd_list);
    }
}

void    debug_print_cmd(t_pars_cmd *cmd)
{
    int i;

    printf("\n=== Command Structure ===\n");
    printf("Command: %s\n", cmd->cmd);
    printf("Command Index: %d\n", cmd->cmd_index);
    printf("PID: %d\n", cmd->pid);
    printf("HD Number: %d\n", cmd->hd_nb);
    if (cmd->infile)
        printf("Infile: %s\n", cmd->infile);
    if (cmd->outfile)
        printf("Outfile: %s\n", cmd->outfile);
    printf("Append: %d\n", cmd->append);
    if (cmd->args)
    {
        printf("Args: ");
        i = 0;
        while (cmd->args[i])
        {
            printf("[%s] ", cmd->args[i]);
            i++;
        }
        printf("\n");
    }
    if (cmd->delimiters)
    {
        printf("Delimiters: ");
        i = 0;
        while (cmd->delimiters[i])
        {
            printf("[%s] ", cmd->delimiters[i]);
            i++;
        }
        printf("\n");
    }
    printf("=====================\n\n");
}

//change nbr of returning errors for different errors
int main(int ac, char **av, char **envp)
{
    t_minishell *data;

    global_exit_flag = 0;
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
    return (global_exit_flag);
}
