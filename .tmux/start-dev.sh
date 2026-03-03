#!/bin/bash

SESSION="dev"

# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Create detached session
  tmux new-session -d -s $SESSION -n main

  # Split panes explicitly
  tmux split-window -h -t $SESSION:0.0   # Split pane 0 horizontally -> pane 1
  tmux split-window -v -t $SESSION:0.1   # Split pane 1 vertically -> pane 2

  # Select top-left pane as the default starting pane
  tmux select-pane -t $SESSION:0.0

  # Optional: send commands to each pane
   # # Pane 0: editor
   # tmux send-keys -t $SESSION:0.0 'cd ~/projects && nvim' C-m
   # # Pane 1: git status
   # tmux send-keys -t $SESSION:0.1 'cd ~/projects && git status' C-m
   # # Pane 2: monitor system
   # tmux send-keys -t $SESSION:0.2 'htop' C-m
fi

# Attach to session
tmux attach -t $SESSION
