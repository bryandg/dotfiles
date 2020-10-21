all: vim vim-key-bindings terminal cli-tools 
.PHONY: all vim vim-key-bindings terminal cli-tools fzf submodules

vim:
	cd ..; ln -nsf dotfiles/vim .vim

vim-key-bindings:
	if grep "set -o vi" ../.bashrc; \
	then \
		echo "vim keybindings already set"; \
	else \
		echo "set -o vi" >> ../.bashrc; \
	fi \

terminal:
	cd ..; ln -nsf dotfiles/udacity-terminal-config .udacity-terminal-config;
	if grep -Fq ".udacity-terminal-config" ../.bash_profile; \
	then \
		echo "bash_profile already references .udacity-terminal-config"; \
	else \
		cat udacity-terminal-config/bash_profile >> ../.bash_profile; \
	fi \

cli-tools: fzf

fzf: submodules
	which fzf && echo "fzf already installed" || ./cli-tools/fzf/install && echo "source ~/.fzf.bash" >> ~/.bash_profile

submodules:
	git submodule init && git submodule update
