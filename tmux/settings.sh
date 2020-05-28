#!/bin/sh

# copy base to conf
cp -f $PWD/tmux/tmux.conf.base $PWD/tmux/tmux.conf

# add simple tmux settings
echo "" >> $PWD/tmux/tmux.conf
cat $PWD/tmux/tmux.conf.simple >> $PWD/tmux/tmux.conf

# set fish as default shell
fish_path=`which fish`
echo "" >> $PWD/tmux/tmux.conf
echo "# set fish as default shell" >> $PWD/tmux/tmux.conf
echo "set-option -g default-shell $fish_path" >> $PWD/tmux/tmux.conf
echo "set -g default-command $fish_path" >> $PWD/tmux/tmux.conf

