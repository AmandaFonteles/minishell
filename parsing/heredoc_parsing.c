#include "../inc/minishell.h"

int fill_heredocs(t_pars_cmd *cmd) {
    t_token *cur = *(cmd->token);
    int hd_count = 0;
    int i = 0;

    // Compter le nombre de heredocs
    while (cur) {
        if (cur->type == HERE_DOC && cur->next)
            hd_count++;
        cur = cur->next;
    }
    if (hd_count == 0)
        return 1;

    // Allouer le tableau de délimiteurs
    cmd->delimiters = malloc(sizeof(char *) * (hd_count + 1));
    if (!cmd->delimiters)
        return 0;

    // Remplir le tableau de délimiteurs
    cur = *(cmd->token);
    while (cur) {
        if (cur->type == HERE_DOC && cur->next) {
            cmd->delimiters[i++] = ft_strdup(cur->next->word);
            if (!cmd->delimiters[i-1])
                return 0;
        }
        cur = cur->next;
    }
    cmd->delimiters[i] = NULL;
    cmd->hd_nb = hd_count;
    return 1;
}
