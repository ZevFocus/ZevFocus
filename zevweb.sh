!/bin/bash

tmux new-session -d -s ZevWebOfficial

tmux send-keys "nvim ~/Code/ZevFocusW" C-m
tmux rename-window "Code"

tmux new-window -t ZevWebOfficial:2 -n "term"
tmux send-keys "nvim ~/Code/ZevFocusW -c 'terminal'" C-m

tmux attach -t ZevWebOfficial
