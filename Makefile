DOTFILES=~/.gitconfig \
		 ~/.zshrc \
		 ~/.zpreztorc \
		 ~/.vimrc \
		 ~/.vim/bundle \
		 ~/.zprezto

.PHONY:all clean

all: $(DOTFILES)

clean:
	rm -rf $(DOTFILES)

# Default use case: Symlink the repo file to ~/
~/.%: .%
	ln -sf $(abspath $<) $@

# Vundle
~/.vim/bundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +PluginClean +qall

# Prezto
~/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
