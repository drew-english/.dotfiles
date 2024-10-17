#!/usr/bin/env bash
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

# Flags:
# [-s] search within given dirs

ignored_folders="worktrees"
selected="~/"
dir_start_idx=1

if [[ $1 == "-s" ]]; then
        dir_start_idx=2
fi

if [[ $# -ge 1 ]]; then
    selected="${*:$dir_start_idx}"
fi


if [[ $1 == "-s" ]]; then
    selected=$(find $selected -mindepth 1 -maxdepth 1 -type d  -not -regex ".*\(${ignored_folders}\)$" | fzf)
fi

if [[ ! -d $selected ]]; then
        exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected $NEW_SESSION_CMD
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected $NEW_SESSION_CMD
fi

tmux switch-client -t $selected_name

