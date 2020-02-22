# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# AWS completion
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# enviroment values
set -x EDITOR vi
set -x DOCKER_HOST tcp://192.168.64.4:2376

# into vim mode
fish_vi_key_bindings

# peco history
function fish_user_key_bindings
  bind \cr peco_select_history
end

# aliases
alias vi 'nvim'
# alias ls 'gls --color=auto' 
alias tcp 'tmux save-buffer - | reattach-to-user-namespace pbcopy'
alias tmuxx 'tmux attach; or tmux new-session \; source-file ~/.dotfiles/tmux/session'
alias tmuxvim 'tmux splitw -v -p 30'

#direnv
eval (direnv hook fish)
