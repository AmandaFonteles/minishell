#include "../inc/minishell.h"
#include <stdio.h>

// Affiche le contenu d'une commande parsée
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
    printf("Infile: %s\n", cmd->infile ? cmd->infile : "(null)");
    printf("Outfile: %s\n", cmd->outfile ? cmd->outfile : "(null)");
    printf("Append: %d\n", cmd->append);
    printf("====================\n");
}

// Affiche toutes les commandes d'une liste
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
        "echo \"hello $USER\" | cat",
        "cat < infile > outfile",
        "echo test >> out.txt",
        "cat << EOF",
        "cat << 'EOF' | grep test",
        "echo \"a | b\" | wc",
        "ls | grep .c > result.txt",
        "cat << EOF > out.txt",
        "echo $HOME",
        "echo \"'$HOME'\"",
        "echo '\"$HOME\"'",
        NULL
    };

    printf("=== Testing parse_input ===\n\n");

    for (int i = 0; test_cases[i]; i++)
    {
        printf("\nTest case %d: '%s'\n", i + 1, test_cases[i]);
        printf("-------------------\n");

        cmds = parse_input(ft_strdup(test_cases[i]));
        if (cmds)
        {
            if (ft_tokenise(cmds)) {
                // Appelle ici fill_heredocs/fill_redirections si besoin
                t_pars_cmd *cur = *cmds;
                while (cur) {
                    fill_heredocs(cur);
                    // fill_redirections(cur); // à faire si tu veux tester aussi les redirections
                    cur = cur->next;
                }
                print_all_cmds(cmds);
            }
            // free_cmd_node(*cmds); // Décommente pour libérer la mémoire si besoin
        }
        else
        {
            printf("Parsing failed!\n");
        }
    }

    return 0;
}
