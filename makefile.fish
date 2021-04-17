.PHONY:

fish: setup_fish setup_completions

setup_fish: functions ~/.config/fish/config.fish ~/.config/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_mode_prompt.fish
functions:
	mkdir -p ~/.config/fish/$@
~/.config/fish/config.fish:
	ln -s $(PWD)/fish/config.fish $@
~/.config/fish/functions/fish_prompt.fish:
	ln -s $(PWD)/fish/fish_prompt.fish $@
~/.config/fish/functions/fish_mode_prompt.fish:
	ln -s $(PWD)/fish/fish_mode_prompt.fish $@

setup_completions: completions docker.fish docker-compose.fish git.fish
completions:
	mkdir -p ~/.config/fish/$@
docker.fish:
	curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/$@
docker-compose.fish:
	curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/$@
git.fish:
	curl https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/completions/git.fish > ~/.config/fish/completions/git.fish
	# curl https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git.fish -o ~/.config/fish/completions/$@

