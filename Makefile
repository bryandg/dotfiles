all: vim terminal
.PHONY: all vim terminal

vim:
	cd ..; ln -s dotfiles/vim/.vim .vim

terminal:
	cd ..; ln -sf dotfiles/udacity-terminal-config/.udacity-terminal-config .udacity-terminal-config;
	if grep -Fq ".udacity-terminal-config" ../.bash_profile; \
	then \
		echo "bash_profile already references .udacity-terminal-config"; \
	else \
		cat udacity-terminal-config/udacity_bash_profile >> ../.bash_profile; \
	fi \
