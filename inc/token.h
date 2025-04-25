#ifndef TOKEN_H
# define TOKEN_H

#include "minishell.h"

typedef enum type
{
	NONE,
	ARG,
	FILE_IN,
	HERE_DOC,
	FILE_OUT,
	FILE_OUT_SUR,
	OPEN_FILE,
	LIMITOR,
	EXIT_FILE,
	EXIT_FILE_RET,
	QUOTE
}					t_type;

typedef struct token
{
	char			*word;
	enum type		type;
	struct token	*next;
}					t_token;


///////////////////// PARSING TOKENS /////////////////////

t_pars_cmd	**parse_input(char *str);
int	ft_check(char *str, int i, int d, int s);
int	process_input(t_minishell *data);

///////////////////// PARSING UTILS /////////////////////

char	**ft_shell_split(char *str, char sep, int d, int s);
char	*ft_shell_strdup(const char *str, char sep);
void	handle_special_chars(char *str, int *i, int *d, int *s);
int	calculate_len_w(const char *str, char sep);
int	ft_nb_word(char *str, char c);


#endif
