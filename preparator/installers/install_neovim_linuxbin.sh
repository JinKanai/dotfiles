#!/bin/sh

curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -o /tmp/nvim.tar.gz
tar zxvf /tmp/nvim.tar.gz -C /tmp

sudo mv /tmp/nvim-linux64/bin/nvim /usr/local/bin/
sudo mv /tmp/nvim-linux64/share/nvim /usr/local/share

rm -rf /tmp/nvim*

