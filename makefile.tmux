.PHONY:

tmux: $(HOME)/.tmux.conf

$(HOME)/.tmux.conf:
	sh tmux/settings.sh
	ln -s $(PWD)/tmux/tmux.conf $@

clean_tmux:
	rm -f ~/.tmux.conf
	rm -f $(PWD)/tmux/tmux.conf


