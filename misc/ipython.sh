#!/bin/sh

ipython_config="$HOME/.ipython/profile_default/ipython_config.py"
mkdir -p `dirname $ipython_config`
touch $ipython_config
echo "c.TerminalInteractiveShell.editing_mode = 'vi'" >> $ipython_config

