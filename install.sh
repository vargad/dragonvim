#!/usr/bin/env bash

set -e

function update_link()
{
    dest="$HOME/.$1"
    dest_dir=$(dirname "${dest}")
    mkdir -p "$dest_dir"
    if [[ ! -e $dest || -L $dest ]]; then
        echo "Updating $dest"
        ln -sf "`readlink -f $1`" $dest
    else
        echo "File already exists: $dest"
    fi
}

function setup_vim()
{
    plug_module=~/.vim/autoload/plug.vim
    if [[ ! -e "$plug_module" ]]; then
        echo "Installing vim-plug"
        curl -fLo "$plug_module" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    if [[ ! -e ~/.vim/node ]]; then
        echo "Installing node-16 for GitHub Copilot"
        mkdir -p ~/.vim/node
        curl -fLo /tmp/node.tar.xz https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.xz
        tar xpvf /tmp/node.tar.xz -C ~/.vim/node --strip-components=1
    fi

    update_link vimrc
    update_link vim/smartmake.rb
    update_link config/nvim/init.vim
    update_link config/nvim/lua/plugins.lua
    update_link config/nvim/lua/startup-theme.lua
}

setup_vim
