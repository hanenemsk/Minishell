CC = gcc

RM = rm -f

CFLAGS = -Wall -Wextra -Werror

MY_CPPFLAGS = -I$(LIBPATH) -I$(LIBFTDIR) -I$(GNLDIR)

CPPFLAGS = $(MY_CPPFLAGS)

NAME = Minishell 

SRCDIR = ./srcs

SRC = $(wildcard $(SRCDIR)/*.c)

LIBPATH = ./lib

LIBFTDIR = $(LIBPATH)/libft
APLIBFT = $(LIBFTDIR)/libft.a

OBJ = $(SRC:.c=.o)

LDLIBS = $(APLIBFT)

all:
	@$(MAKE) -j $(NAME)	

$(NAME): $(SRC)
	@$(MAKE) -j -s --no-print-directory -C lib/libft/
	@$(MAKE) -j -s --no-print-directory -C lib/gnl/
	$(CC) $(LDLIBS) $(CFLAGS) $(SRC) $(APLIBFT) -o $(NAME)

%.o : %.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $(SRC) $< -o $@ 

clean:
	@$(MAKE) -s --no-print-directory -C lib/libft/ clean
	@$(MAKE) -s --no-print-directory -C lib/gnl/ clean 
	$(RM) $(OBJ)

fclean: clean
	@$(MAKE) -s --no-print-directory -C lib/libft/ fclean
	@$(MAKE) -s --no-print-directory -C lib/gnl/ fclean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
