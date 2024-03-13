#!/usr/bin/env zsh

STOW_FOLDERS="zsh home tmux"
[[ -v OS_STOW_FOLDERS ]] && STOW_FOLDERS="$STOW_FOLDERS $OS_STOW_FOLDERS"

for folder in  $(echo $STOW_FOLDERS)
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

