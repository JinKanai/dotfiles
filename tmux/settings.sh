#!/bin/sh

tmux_conf_path=`locate powerline.conf|grep python3`
echo $tmux_conf_path
tmux_path=`dirname $tmux_conf_path|sed -e "s/\/bindings\/tmux//g"`
echo $tmux_path

# copy configs to home.config
cp -rf $tmux_path/config_files/* $HOME/.config/powerline/
mv $HOME/.config/powerline/config.json $PWD/tmux/config.json.bak

cp -f $PWD/tmux/tmux.conf.base $PWD/tmux/tmux.conf

# add powerline to tmux.conf
echo "source $tmux_path/bindings/tmux/powerline.conf" >> $PWD/tmux/tmux.conf

# set fish as default shell
fish_path=`which fish`
echo "" >> $PWD/tmux/tmux.conf
echo "# set fish as default shell" >> $PWD/tmux/tmux.conf
echo "set-option -g default-shell $fish_path" >> $PWD/tmux/tmux.conf
echo "set -g default-command $fish_path" >> $PWD/tmux/tmux.conf

