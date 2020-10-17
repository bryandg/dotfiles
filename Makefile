all: vim terminal
.PHONY: all vim terminal

vim:
	cd ..; ln -nsf dotfiles/vim .vim

terminal:
	cd ..; ln -nsf dotfiles/udacity-terminal-config .udacity-terminal-config;
	if grep -Fq ".udacity-terminal-config" ../.bash_profile; \
	then \
		echo "bash_profile already references .udacity-terminal-config"; \
	else \
		cat udacity-terminal-config/bash_profile >> ../.bash_profile; \
	fi \
