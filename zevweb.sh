!/bin/bash

tmux new-session -d -s ZevWebOfficial -c ~/Code/ZevFocusW

tmux send-keys "nvim ~/Code/ZevFocusW" C-m
tmux rename-window "Code"

tmux new-window -t ZevWebOfficial:2 -n "term" -c ~/Code/ZevFocusW
tmux send-keys "nvim ~/Code/ZevFocusW -c 'terminal'" C-m

tmux attach -t ZevWebOfficial
