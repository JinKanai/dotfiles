.PHONY: vim

vim: $(HOME)/.vim \
 $(HOME)/.config/nvim \
 $(HOME)/.vimrc \
 $(HOME)/.config/nvim/init.vim \
 $(HOME)/.vim/colors \
 $(HOME)/.config/nvim/colors \
 $(HOME)/.vim/dein.toml \
 $(HOME)/.vim/dein_lazy.toml \
 $(HOME)/.ideavimrc
	
$(HOME)/.vim:
	mkdir -p $@
$(HOME)/.config/nvim:
	mkdir -p $@
$(HOME)/.vimrc:
	ln -s $(PWD)/vim/vimrc $@
$(HOME)/.config/nvim/init.vim:
	ln -s $(PWD)/vim/vimrc $@
$(HOME)/.vim/colors:
	ln -s $(PWD)/vim/colors/ $@
$(HOME)/.config/nvim/colors:
	ln -s $(PWD)/vim/colors/ $@
$(HOME)/.vim/dein.toml:
	ln -s $(PWD)/vim/dein.toml $@
$(HOME)/.vim/dein_lazy.toml:
	ln -s $(PWD)/vim/dein_lazy.toml $@
$(HOME)/.ideavimrc:
	cp $(PWD)/vim/vimrc $@
	echo "set surround" >> $@

