#include "../inc/minishell.h"
#include <stdio.h>
#include <string.h>  // Pour strdup

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

void print_cmd_structure(t_pars_cmd *cmd)
{
    printf("\n=== Command Structure ===\n");
    printf("Command: %s\n", cmd->cmd);
    printf("Command Index: %d\n", cmd->cmd_index);
    printf("PID: %d\n", cmd->pid);
    printf("HD Number: %d\n", cmd->hd_nb);

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
    if (cmd->infile)
        printf("Infile: %s\n", cmd->infile);
    if (cmd->outfile)
        printf("Outfile: %s\n", cmd->outfile);
    printf("Append: %d\n", cmd->append);

    if (cmd->args)
    {
        printf("Args: ");
        for (int i = 0; cmd->args[i]; i++)
            printf("[%s] ", cmd->args[i]);
        printf("\n");
    }
    printf("=====================\n\n");
}

void test_parse_input(const char *input)
{
    printf("\n=== Testing: '%s' ===\n", input);

    t_minishell data;
    data.user_input = strdup(input);
    if (!data.user_input)
    {
        printf("Error: Failed to allocate memory for input\n");
        return;
    }

    printf("1. Input copied to data.user_input\n");

    t_pars_cmd **cmds = parse_input(data.user_input);
    if (!cmds)
    {
        printf("2. parse_input returned NULL\n");
        free(data.user_input);
        return;
    }
    printf("2. parse_input successful\n");

    if (!*cmds)
    {
        printf("3. *cmds is NULL\n");
        free(cmds);
        free(data.user_input);
        return;
    }
    printf("3. *cmds is valid\n");

    if (ft_tokenise(cmds))
    {
        printf("4. Tokenization successful\n");
        t_pars_cmd *current = *cmds;
        while (current)
        {
            print_cmd_structure(current);
            current = current->next;
        }
    }
    else
    {
        printf("4. Tokenization failed\n");
    }

    free_cmd_node(*cmds);
    free(cmds);
    free(data.user_input);
}

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
    printf("\n=== Starting Parsing Tests ===\n\n");

    test_parse_input("echo $HOME");
    test_parse_input("echo \"'$HOME'\"");
    test_parse_input("echo '\"$HOME\"'");
    test_parse_input("ls -l");
    test_parse_input("echo 'hello' | grep h");
    test_parse_input("cat file.txt | grep test | wc -l");
    test_parse_input("echo \"hello $USER\" | cat");
    test_parse_input("cat < infile > outfile");
    test_parse_input("echo test >> out.txt");
    test_parse_input("cat << EOF");
    test_parse_input("cat << 'EOF' | grep test");
    test_parse_input("echo \"a | b\" | wc");
    test_parse_input("ls | grep .c > result.txt");
    test_parse_input("cat << EOF > out.txt");

    printf("\n=== Parsing Tests Completed ===\n");

    //free all the memory allocated
    return (0);
}
// int main(void)
// {
//     printf("\n=== Starting Parsing Tests ===\n\n");

//     // Test cases
//     // test_parse_input("ls -l");
//     // test_parse_input("echo 'hello' | grep h");
//     // test_parse_input("cat file.txt | grep test | wc -l");
//     // test_parse_input("echo \"hello $USER\" | cat");
//     // test_parse_input("cat < infile > outfile");
//     // test_parse_input("echo test >> out.txt");
//     // test_parse_input("cat << EOF");
//     // test_parse_input("cat << 'EOF' | grep test");
//     // test_parse_input("echo \"a | b\" | wc");
//     // test_parse_input("ls | grep .c > result.txt");
//     // test_parse_input("cat << EOF > out.txt");
//     test_parse_input("echo $HOME");
//     test_parse_input("echo \"'$HOME'\"");
//     test_parse_input("echo '\"$HOME\"'");

//     printf("\n=== Parsing Tests Completed ===\n");
//     return 0;
// }
