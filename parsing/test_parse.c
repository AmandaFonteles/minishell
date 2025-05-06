#include "../inc/minishell.h"
#include <stdio.h>

void print_split_result(char **tab)
{
    if (!tab)
    {
        printf("Split returned NULL\n");
        return;
    }
    printf("\n=== Split Result ===\n");
    for (int i = 0; tab[i]; i++)
        printf("Command %d: [%s]\n", i, tab[i]);
    printf("==================\n\n");
}

void print_cmd(t_pars_cmd *cmd)
{
    if (!cmd)
        return;
    printf("\n=== Command Details ===\n");
    printf("Command: %s\n", cmd->cmd);
    printf("Command index: %d\n", cmd->cmd_index);
    printf("PID: %d\n", cmd->pid);
    printf("HD number: %d\n", cmd->hd_nb);
    if (cmd->args)
    {
        printf("Args: ");
        for (int i = 0; cmd->args[i]; i++)
            printf("[%s] ", cmd->args[i]);
        printf("\n");
    }
    if (cmd->heredoc)
    {
        printf("Heredoc: ");
        for (int i = 0; cmd->heredoc[i]; i++)
            printf("[%s] ", cmd->heredoc[i]);
        printf("\n");
    }
    if (cmd->delimiters)
    {
        printf("Delimiters: ");
        for (int i = 0; cmd->delimiters[i]; i++)
            printf("[%s] ", cmd->delimiters[i]);
        printf("\n");
    }
    printf("Infile: %s\n", cmd->infile);
    printf("Outfile: %s\n", cmd->outfile);
    printf("Append: %d\n", cmd->append);
    printf("====================\n");
}

void print_all_cmds(t_pars_cmd **cmds)
{
    t_pars_cmd *current;

    if (!cmds || !*cmds)
    {
        printf("No commands to display\n");
        return;
    }
    current = *cmds;
    while (current)
    {
        print_cmd(current);
        current = current->next;
    }
}

int main(void)
{
    t_pars_cmd **cmds;
    char *test_cases[] = {
        "ls -l",
        "echo 'hello' | grep h",
        "cat file.txt | grep test | wc -l",
        "echo \"hello world\" | cat",
        NULL
    };

    printf("=== Testing parse_input ===\n\n");

    for (int i = 0; test_cases[i]; i++)
    {
        printf("\nTest case %d: '%s'\n", i + 1, test_cases[i]);
        printf("-------------------\n");

        // Test du split
        char **split_result = ft_shell_split(test_cases[i], '|', 0, 0);
        print_split_result(split_result);
        // free(split_result); // Commenté pour le test

        // Test du parsing complet
        cmds = parse_input(ft_strdup(test_cases[i]));
        print_all_cmds(cmds);
        // if (cmds)
            // free_cmd_node(*cmds); // Commenté pour le test
    }

    return (0);
}
