all: vim vim-key-bindings terminal cli-tools fzf submodules
.PHONY: all vim vim-key-bindings terminal cli-tools fzf submodules

vim:
	cd ..; ln -nsf dotfiles/vim .vim

vim-ycm: submodules
	brew install cmake macvim python mono go nodejs
	git submodule update --init --recursive	
	python vim/pack/dist/start/YouCompleteMe/install.py # cannot be anaconda python!
	echo "alias vim='mvim -v'" >> ../.bashrc

vim-key-bindings:
	if grep "set -o vi" ../.bashrc; \
	then \
		echo "vim keybindings already set"; \
	else \
		echo "set -o vi" >> ../.bashrc; \
	fi \

terminal:
	cd ..; ln -nsf dotfiles/udacity-terminal-config .udacity-terminal-config;
	if grep -Fq "udacity-terminal-config" ../.bashrc; \
	then \
		echo "bashrc already references udacity-terminal-config"; \
	else \
		echo "source ~/dotfiles/udacity-terminal-config/bash_profile" >> ../.bashrc; \
	fi \

cli-tools: fzf

fzf: submodules
	which fzf && echo "fzf already installed" || ./cli-tools/fzf/install && echo "source ~/.fzf.bash" >> ~/.bash_profile

ctags:
	which ctags && echo "ctags already installed" || brew install ctags

submodules:
	git submodule init && git submodule update
