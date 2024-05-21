#!/usr/bin/env zsh

STOW_FOLDERS="nvim tmux zed zsh asdf"
[[ -v OS_STOW_FOLDERS ]] && STOW_FOLDERS="$STOW_FOLDERS $OS_STOW_FOLDERS"

for folder in  $(echo $STOW_FOLDERS)
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

