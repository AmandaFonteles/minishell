# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adregis <adregis@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/06 18:35:57 by afontele          #+#    #+#              #
#    Updated: 2025/07/10 11:01:56 by adregis          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = minishell


CC = cc
CFLAGS = -Wall -Wextra -Werror -g3
LDFLAGS = -lreadline
LIBFT = $(LIBFTDIR)/libft.a
LDFLAGS += -L$(LIBFTDIR) -lft
RM = rm -rf
INC = ./inc/minishell.h


SRCDIR = src/
PARS = parsing/
OBJDIR = obj/
INCDIR = inc/
LIBFTDIR = libft/


SRC = $(SRCDIR)main.c \
		$(SRCDIR)builtins.c \
		$(SRCDIR)builtin_utils.c \
		$(SRCDIR)builtin_utils_2.c \
		$(SRCDIR)cd.c \
		$(SRCDIR)env_exp.c \
		$(SRCDIR)env_exp_2.c \
		$(SRCDIR)pwd_echo_unset.c \
		$(SRCDIR)exit.c \
		$(SRCDIR)error.c \
		$(SRCDIR)error_2.c \
		$(SRCDIR)free.c \
		$(SRCDIR)free_2.c \
		$(SRCDIR)execve_hub.c \
		$(SRCDIR)execve_hub_2.c \
		$(SRCDIR)pipes.c \
		$(SRCDIR)processes.c \
		$(SRCDIR)processes_2.c \
		$(SRCDIR)redirections.c \
		$(SRCDIR)redirections_2.c \
		$(SRCDIR)setup_exec.c \
		$(SRCDIR)heredoc.c \
		$(SRCDIR)heredoc_2.c \
		$(SRCDIR)env_management.c \
		$(SRCDIR)init.c \
		$(SRCDIR)init_2.c \
		$(SRCDIR)signals.c \
		$(SRCDIR)uniq_cmd.c \
		$(PARS)parse.c \
		$(PARS)tokenization.c \
		$(PARS)parse_utils.c \
		$(PARS)parse_utils_2.c \
		$(PARS)parse_utils_3.c \
		$(PARS)token_utils.c \
		$(PARS)token_utils_2.c \
		$(PARS)token_utils_3.c \
		$(PARS)token_utils_4.c \
		$(PARS)token_utils_5.c \
		$(PARS)expend.c \
		$(PARS)expend_utils.c \
		$(PARS)expend_utils2.c \
		$(PARS)expend_utils_3.c \
		$(PARS)expend_d.c \
		$(PARS)error_pars.c \
		$(PARS)error_pars_2.c \
		$(PARS)free_parse.c \
		$(PARS)free_parse_2.c \
		$(PARS)syntax_check.c \
		$(PARS)heredoc_parsing.c \
		$(PARS)redir_utils.c \


OBJ = $(addprefix $(OBJDIR), $(notdir $(SRC:.c=.o)))


all: $(NAME)

$(LIBFT):
		@make -C $(LIBFTDIR)


$(NAME): $(OBJ) $(LIBFT)
		@$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
		@echo "\033[32m[Executable created]\033[0m"

$(OBJDIR)%.o: $(SRCDIR)%.c
		@mkdir -p $(OBJDIR)
		$(CC) $(CFLAGS) -I $(INCDIR) -o $@ -c $<
$(OBJDIR)%.o: $(PARS)%.c
		@mkdir -p $(OBJDIR)
		$(CC) $(CFLAGS) -I $(INCDIR) -o $@ -c $<

clean:
		@$(RM) $(OBJDIR)
		@echo "\033[31m[Objects removed]\033[0m"

fclean: clean
		@$(RM) $(NAME)
		@make -C $(LIBFTDIR) fclean
		@echo "\033[31m[Executable removed]\033[0m"

re: fclean all

.PHONY: all clean fclean re
