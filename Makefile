##
## EPITECH PROJECT, 2018
## epitech
## File description:
## asm
##

LD      	= 	ld

ASM		= 	nasm

RM      	= 	rm -rf

NAME    	= 	libasm.so

SRC    		= 	my_strlen.asm \
			my_strcmp.asm \
			my_strchr.asm \
			my_memset.asm \
			my_memcpy.asm \
			my_memmove.asm \
			my_strncmp.asm \
			my_rindex.asm

OBJS    	= 	$(SRC:.asm=.o)

ASMFLAGS	= 	-f elf64

LDFLAGS		=	-shared

all:    	$(SRC) $(NAME)

$(NAME): 	$(OBJS)
		$(LD) $(LDFLAGS) $(OBJS) -o $@

clean:
		$(RM) $(OBJS)

fclean: 	clean
		$(RM) $(NAME)

re:     	fclean all

%.o: %.asm
		$(ASM) $(ASMFLAGS) $< -o $@

.PHONY: 	all clean fclean re
