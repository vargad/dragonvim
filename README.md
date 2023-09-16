# DragonVim 
### _yet another attempt to create a vim configuration with some handy features_

This is my personal vim configuration. It builds on many excellent plugins and
supports vim, gvim, nvim and neovide. Some features are specific to the
respective vim variant, but most of the configuration is shared.


## Ubuntu 22.04 installation instructions

Install required packages

    sudo apt-get update
    sudo apt install -y cmake cppcheck vim-gtk3 git curl libfontconfig-dev libfreetype-dev ca-certificates curl gnupg fonts-firacode xclip pip clangd python3-pylsp python3-pylsp-mypy python3-pylsp-isort

Install rust

    $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    $ source "$HOME/.cargo/env"
    $ rustup component add rust-analyzer

Install neovim and neovide

    sudo snap install --classic nvim
    cargo install --git https://github.com/neovide/neovide
    python3 -m pip install --user --upgrade pynvim


## Install

Clone DragonVim repository to a directory:

    $ git clone https://github.com/vargad/dragonvim.git

Create symlinks to the configuration files you want to use, or just run my
install.sh script, which creates symlinks (or updates exsiting symlinks):

    $ cd dragonvim
    $ ./install.sh

Make sure all plugins are installed

    $ neovide -- -c 'silent' -c 'PlugInstall' -c 'PlugUpgrade' -c 'PackerInstall' -c 'PackerUpdate' -c 'qa!'

Please note that the script does not delete any files. It skips all existing
files (and prints a warning), unless it's a symlink, in that case it updates
the link.
