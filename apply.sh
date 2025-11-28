#!/bin/sh

copy_if_dst_exists() {
    SRC="$1"
    DST="$2"
    if [ -f "$DST" ]; then
        cp "$SRC" "$DST"
    fi
}

# Don't overwrite .gitconfig because email varies across systems
# copy_if_dst_exists .gitconfig ~/.gitconfig
copy_if_dst_exists .gitignore ~/.gitignore
copy_if_dst_exists .zshrc ~/.zshrc
copy_if_dst_exists .zprofile ~/.zprofile
copy_if_dst_exists nvim/init.vim ~/.config/nvim/init.vim
copy_if_dst_exists nvim/colors/vanilla-toms.vim ~/.config/nvim/colors/vanilla-toms.vim
