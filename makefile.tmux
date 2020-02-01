.PHONY:

tmux: $(HOME)/.config/powerline/config.json \
 $(HOME)/.config/powerline/themes/tmux/mytheme.json \
 $(HOME)/.tmux.conf

$(HOME)/.config/powerline/config.json:
	mkdir -p $(HOME)/.config/powerline
	tmux/settings.sh
	ln -s $(PWD)/tmux/config.json $@

$(HOME)/.config/powerline/themes/tmux/mytheme.json:
	ln -s $(PWD)/tmux/mytheme.json $@

$(HOME)/.tmux.conf:
	ln -s $(PWD)/tmux/tmux.conf $@


