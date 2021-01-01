all: vim vim-key-bindings terminal cli-tools fzf submodules
.PHONY: all vim vim-key-bindings terminal cli-tools fzf submodules

SHELL := /bin/bash

vim: submodules vim-dir

vim-dir:
	@bash utils link 'vim' '.vim'

clean-vim-dir:
	@bash utils unlink '.vim'

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

tilix:
	@ln -nsf ~/dotfiles/config/tilix/schemes/OneDark.json ~/.config/tilix/schemes/OneDark.json
	@printf "To enable the OneDark tilix theme: \n
	Open up tilix preferences (you can use the command tilix --preferences), \n \
	go to select your profile from the Profiles section, select the color tab, \n \
	and select the OneDark color scheme to enable\n"\

zsh:
	@ln -s ~/dotfiles/oh-my-zsh/themes/keith12345.zsh-theme ~/.oh-my-zsh/themes/keith12345.zsh-theme

git-dir:
	@bash utils check_for_global_gitignore
	@bash utils link 'git/gitignore' '.gitignore'

clean-git-dir:
	@bash utils unlink '.gitignore'
