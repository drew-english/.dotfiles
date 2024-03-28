#!/bin/bash
# https://github.com/tmux-plugins/tmux-yank

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

clipboard_copy_command() {
	if command_exists "pbcopy"; then
		echo "pbcopy"
	elif command_exists "clip.exe"; then # WSL clipboard command
		echo "cat | clip.exe"
	elif command_exists "wl-copy"; then # wl-clipboard: Wayland clipboard utilities
		echo "wl-copy"
	elif command_exists "xsel"; then
		echo "xsel -i --clipboard"
	elif command_exists "xclip"; then
		echo "xclip -selection clipboard" 
	elif command_exists "putclip"; then # cygwin clipboard command
		echo "putclip"
	fi
}

copy_command=$(clipboard_copy_command)

tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "$copy_command"
tmux bind-key -T copy-mode-vi Y send-keys -X copy-pipe-and-cancel "tmux paste-buffer -p"
tmux bind-key -T copy-mode-vi M-y send-keys -X copy-pipe-and-cancel "$copy_command; tmux paste-buffer -p"
tmux bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "$copy_command"

