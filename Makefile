all: vim vim-key-bindings terminal cli-tools fzf submodules
.PHONY: all vim vim-key-bindings terminal cli-tools fzf submodules

SHELL := /bin/bash

vim: submodules
	if [[ -f ~/.vimrc ]]; \
	then \
		mv ~/.vimrc ~/.vimrc_backup && echo "moved existing ~/.vimrc to ~/.vimrc_backup"; \
	else \
		echo "no existing ~/.vimrc"; \
	fi; \
	#
	if [[ ! `readlink ~/.vim` = ~/dotfiles/vim ]]; \
	then \
		mv ~/.vim ~/.vim_backup && echo "moved existing ~/.vim directory to ~/.vim_backup"; \
		ln -nsf ~/dotfiles/vim ~/.vim && echo "linked ~/.vim to ~/dotfiles/vim"; \
	else \
		echo "~/.vim already linked to ~/dotfiles/vim"; \
	fi \

vim-ycm: submodules
	brew install cmake macvim python mono go nodejs
	git submodule update --init --recursive
	python vim/pack/dist/start/YouCompleteMe/install.py # cannot be anaconda python!
	echo "alias vim='mvim -v'" >> ~/.bashrc

vim-key-bindings:
	if grep "set -o vi" ~/.bashrc; \
	then \
		echo "vim keybindings already set"; \
	else \
		echo "set -o vi" >> ~/.bashrc; \
	fi \

terminal:
	ln -nsf ~/dotfiles/udacity-terminal-config ~/.udacity-terminal-config;
	if grep -Fq "udacity-terminal-config" ~/.bashrc; \
	then \
		echo "bashrc already references udacity-terminal-config"; \
	else \
		echo "source ~/dotfiles/udacity-terminal-config/bash_profile" >> ~/.bashrc; \
	fi \

cli-tools: fzf

fzf: submodules
	which fzf && echo "fzf already installed" || ./cli-tools/fzf/install && echo "source ~/.fzf.bash" >> ~/.bash_profile

ctags:
	which ctags && echo "ctags already installed" || brew install ctags

submodules:
	git submodule init && git submodule update

flake8:
	ln -nsf ~/dotfiles/config/flake8 ~/.config/flake8
	python3 -m pip install flake8

zsh:
	ln -s ~/dotfiles/oh-my-zsh/themes/keith12345.zsh-theme ~/.oh-my-zsh/themes/keith12345.zsh-theme

