include ./makefile.vim
include ./makefile.fish
include ./makefile.tmux

clean_tmux:
	rm -rf ~/.config/powerline
	rm -f ~/.tmux/tmux.conf

clean_vim:
	rm -rf $(HOME)/.vim
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.config/nvim
	rm -f $(HOME)/.viminfo
	rm -rf $(HOME)/.ideavimrc

hardclean: clean_tmux clean_vim

