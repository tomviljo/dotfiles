#!/bin/sh

copy_if_src_exists() {
    SRC="$1"
    DST="$2"
    if [ -f "$SRC" ]; then
        cp "$SRC" "$DST"
    fi
}

# Don't overwrite .gitconfig because email varies across systems
# copy_if_src_exists ~/.gitconfig .gitconfig
copy_if_src_exists ~/.gitignore .gitignore
copy_if_src_exists ~/.zshrc .zshrc
copy_if_src_exists ~/.zprofile .zprofile
copy_if_src_exists ~/.config/nvim/init.vim nvim/init.vim
copy_if_src_exists ~/.config/nvim/colors/vanilla-toms.vim nvim/colors/vanilla-toms.vim
