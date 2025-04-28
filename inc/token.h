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
t_pars_cmd	*ft_lstnew_cmd(char *cmd, t_pars_cmd **cmds, int cmd_index);
t_pars_cmd	*ft_lstlast_cmds(t_pars_cmd *cmd);
void		ft_shell_add_back(t_pars_cmd **cmds, t_pars_cmd *new);



///////////////////// TOKENIZATION /////////////////////

t_token	**ft_create_token(char *str);
int			ft_tokenise(t_pars_cmd **cmds);
char	**ft_split_token(char *str);
int	ft_create_args(t_pars_cmd *cmd);
int	ft_count_args(t_pars_cmd *cmd);
int	ft_count_space(char *str);
int	ft_split_word(char *str, char **args, int index);
char	*dark_strtrim(const char *s1, const char *set);
int	ft_isset(char c, const char *set);
t_token	*ft_lstlast_token(t_token *token);
t_token	*ft_lstnew_token(char *word);
void	ft_lstadd_back_token(t_token **token, t_token *new);
void	set_next_type(t_token *current);
///////////////////// FREE PARSE /////////////////////

void	ft_free_tab(char **tab, int nb);

///////////////////// ERROR PARSING /////////////////////

int	ft_parse_error(char **words);
int	ft_check_dir(char *str);

  ///////////////////// EXPEND /////////////////////

char	*ft_expend(char *str, enum type type, int i, int j);














#endif
