#!/bin/bash

SESSION="dev"

# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Create new session
  tmux new-session -d -s $SESSION -n editor

  # Split first window vertically
  tmux split-window -h

  # Split right pane horizontally
  tmux select-pane -t 1
  tmux split-window -v

  # Optional: run commands in panes
  # tmux send-keys -t editor:0.0 'cd ~/projects && nvim' C-m
  # tmux send-keys -t editor:0.1 'cd ~/projects && git status' C-m
  # tmux send-keys -t editor:0.2 'cd ~/projects && htop' C-m
fi

# Attach to session
tmux attach -t $SESSION
