#include "../inc/minishell.h"

int white_get_env(t_minishell *data, char *envp, t_env **list)
{
    t_env *new;
    t_env *cur;

    new = create_env_node(data, envp);
    if (!new)
        return (0);
    if (!(*list))
    {
        *list = new;
        return (1);
    }
    cur = *list;
    while (cur->next)
        cur = cur->next;
    cur->next = new;
    return (1);
}
