#!/bin/sh

sudo apt install python3 python3-pip
python3 ./preparator/listmaker.py
sudo ./preparator/basic_pkgs.sh
sudo pip3 install -r ./preparator/requirements.txt
sudo ./preparator/installers/install_neovim_linuxbin.sh
sudo updatedb

make fish
make vim
make tmux

fish/install_fisher_plugins.sh
git/gitsettings.sh

echo "===> dotfiles installations are finished. then run 'fish_update_completions in fish shell to update completions.'"
