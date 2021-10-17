#!/usr/bin/env bash

# select the project you wanna work on to create/attach
# to a tmux session
if [[ $# -eq 1 ]]; then
    selected=$1
else
    projects=$(find ~/workspace/devsecops -maxdepth 1 -mindepth 1 -type d)
    projects+=$'\n'
    projects+=$(find ~/workspace/k8s -maxdepth 1 -mindepth 1 -type d)
    selected=$(echo "$projects" | fzf)
fi

dirname=$(basename "$selected")

# create new tmux session (not nested) only if session
# dosn't exist
tmux has-session -t "$dirname" 2> /dev/null || TMUX='' tmux new-session -d -c "$selected" -s "$dirname"

if [[ -z "$TMUX" ]]; then
    # attach to new session (created in detached mode)
    tmux attach -t "$dirname"
else
    # switch to existing session
    tmux switch-client -t "$dirname"
fi
