#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/work_projects ~/private_projects  -mindepth 2  -maxdepth 2 -type d | fzf --layout=reverse);
    # selected=$(find ~/work_projects ~/private_projects  -mindepth 2  -maxdepth 2 -type d | fzf-tmux -p --layout=reverse);
fi

if [[ -z $selected ]]; then
    exit 0
fi

basename=$(basename "$selected" | tr . _)
path=$(dirname "$selected" | tr . _)
dirname=$(basename "$path")
selected_name="${dirname}/${basename}"

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
