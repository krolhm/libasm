NAME = libasm.a

ifeq ($(shell uname), Linux)
ASMFLAGS			=	-felf64 -g -Fdwarf
FOLD				=	linux
else
ASMFLAGS			=	-fmacho64
FOLD				=	macos
endif

SRCS =	$(FOLD)/ft_strlen.s \
		$(FOLD)/ft_strcpy.s \
		$(FOLD)/ft_strcmp.s \
		$(FOLD)/ft_write.s	\
		$(FOLD)/ft_read.s	\
		$(FOLD)/ft_strdup.s

OBJS = $(SRCS:.s=.o)


%.o	: %.s
	nasm $(ASMFLAGS) $< -o $@

$(NAME): $(OBJS) 
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	rm -f $(OBJS)

test: all
	gcc -Wall -Wextra -Werror -I./libasm.h libasm.a tests.c -o go
	./go

fclean: clean
	rm -f $(NAME)
	rm -f go
	rm -f test

re: fclean all