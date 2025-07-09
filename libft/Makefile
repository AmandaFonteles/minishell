# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adregis <adregis@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/11 10:06:57 by afontele          #+#    #+#              #
#    Updated: 2025/07/09 13:07:16 by adregis          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the final library
NAME = libft.a

# Directories
INC = -Iinc/
SRC_DIR = src/
OBJ_DIR = obj/

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror
AR = ar rc
RM = rm -f

# List all source files
SRC = $(SRC_DIR)ft_is/ft_isalnum.c \
      $(SRC_DIR)ft_is/ft_isalpha.c \
      $(SRC_DIR)ft_is/ft_isascii.c \
      $(SRC_DIR)ft_is/ft_isdigit.c \
      $(SRC_DIR)ft_is/ft_isprint.c \
      $(SRC_DIR)ft_lst/ft_lstadd_back.c \
      $(SRC_DIR)ft_lst/ft_lstadd_front.c \
      $(SRC_DIR)ft_lst/ft_lstclear.c \
      $(SRC_DIR)ft_lst/ft_lstdelone.c \
      $(SRC_DIR)ft_lst/ft_lstiter.c \
      $(SRC_DIR)ft_lst/ft_lstlast.c \
      $(SRC_DIR)ft_lst/ft_lstmap.c \
      $(SRC_DIR)ft_lst/ft_lstnew.c \
      $(SRC_DIR)ft_lst/ft_lstsize.c \
      $(SRC_DIR)ft_mem/ft_bzero.c \
      $(SRC_DIR)ft_mem/ft_calloc.c \
      $(SRC_DIR)ft_mem/ft_memchr.c \
      $(SRC_DIR)ft_mem/ft_memcmp.c \
      $(SRC_DIR)ft_mem/ft_memcpy.c \
      $(SRC_DIR)ft_mem/ft_memmove.c \
      $(SRC_DIR)ft_mem/ft_memset.c \
      $(SRC_DIR)ft_put/ft_putchar_fd.c \
      $(SRC_DIR)ft_put/ft_putendl_fd.c \
      $(SRC_DIR)ft_put/ft_putnbr_fd.c \
      $(SRC_DIR)ft_put/ft_putstr_fd.c \
      $(SRC_DIR)ft_str/ft_split.c \
      $(SRC_DIR)ft_str/ft_strchr.c \
      $(SRC_DIR)ft_str/ft_strcmp.c \
      $(SRC_DIR)ft_str/ft_strdup.c \
      $(SRC_DIR)ft_str/ft_striteri.c \
      $(SRC_DIR)ft_str/ft_strjoin.c \
      $(SRC_DIR)ft_str/ft_strlcat.c \
      $(SRC_DIR)ft_str/ft_strlcpy.c \
      $(SRC_DIR)ft_str/ft_strlen.c \
      $(SRC_DIR)ft_str/ft_strmapi.c \
      $(SRC_DIR)ft_str/ft_strncmp.c \
      $(SRC_DIR)ft_str/ft_strnstr.c \
      $(SRC_DIR)ft_str/ft_strrchr.c \
      $(SRC_DIR)ft_str/ft_strtrim.c \
      $(SRC_DIR)ft_str/ft_substr.c \
      $(SRC_DIR)ft_to/ft_atoi.c \
      $(SRC_DIR)ft_to/ft_atoll.c \
      $(SRC_DIR)ft_to/ft_itoa.c \
      $(SRC_DIR)ft_to/ft_tolower.c \
      $(SRC_DIR)ft_to/ft_toupper.c \
      $(SRC_DIR)ft_printf/ft_printf.c \
      $(SRC_DIR)ft_printf/ft_putaddress.c \
      $(SRC_DIR)ft_printf/ft_putchar.c \
      $(SRC_DIR)ft_printf/ft_puthex.c \
      $(SRC_DIR)ft_printf/ft_putnbr.c \
      $(SRC_DIR)ft_printf/ft_putstr.c \
      $(SRC_DIR)ft_printf/ft_putunsigned.c \
      $(SRC_DIR)get_next_line/get_next_line.c \
      $(SRC_DIR)get_next_line/get_next_line_utils.c

# Convert source files to object files
OBJ = $(patsubst $(SRC_DIR)%.c, $(OBJ_DIR)%.o, $(SRC))

# Rules
all: $(NAME)

# Create the static library
$(NAME): $(OBJ)
	@$(AR) $(NAME) $(OBJ)
	@echo "\033[32m[libft.a created]\033[0m"

# Rule to compile .c files into .o files
$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@

# Clean object files
clean:
	@$(RM) -r $(OBJ_DIR)
	@echo "\033[33m[Cleaned object files]\033[0m"

# Clean object files and the library
fclean: clean
	@$(RM) $(NAME)
	@echo "\033[33m[Cleaned library and object files]\033[0m"

# Rebuild everything
re: fclean all

.PHONY: all clean fclean re
