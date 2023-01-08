# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: htomas-d <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/08 13:16:49 by htomas-d          #+#    #+#              #
#    Updated: 2022/09/19 10:04:50 by htomas-d         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= minishell

SRCS		= $(wildcard srcs/*.c)

OBJS		= $(SRCS:%.c=%.o)

LIBFTA		= ./libft/libft.a

RM		= rm -f

CC		= gcc -Wall -Wextra -Werror #-g -fsanitize=address

.c.o:
			@$(CC) -c $< -o $@

all:		$(NAME)

$(NAME): 	$(LIBFTA) $(OBJS)
			@echo "$(BLUE)Compiling . . . . . . .$(DEFAULT)"
			$(CC) $(OBJS) $(LIBFTA) -o $(NAME)
			@echo "$(GREEN)Successfully built --> $(YELLOW)$(NAME)$(DEFAULT)"

$(LIBFTA):
			@make -C libft

clean:
			$(RM) $(OBJS)

fclean:		clean
			$(RM) $(NAME)
			make -C libft fclean
			@echo "$(RED)Files Removed!$(DEFAULT)"

re:			fclean all

god:
			git status
			git add .
			git commit -m "random Makefile commit😋"

.PHONY:		all clean re fclean

#COLORS
GREEN = \033[1;32m
RED = \033[1;31m
DEFAULT = \033[0m
YELLOW = \033[1;33m
