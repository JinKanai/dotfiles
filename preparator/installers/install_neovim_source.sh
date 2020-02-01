#!/bin/sh

which nvim > /dev/null 2>&1                                                    
ret=$?                                                                         

if [ $ret -eq 0 ];then                                                         
    echo 'nvim is installed.nothing to do.'                                      
else                                                                           
    git clone --depth 1 https://github.com/neovim/neovim.git
    cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd -
fi     

