#!/bin/bash

# set tmux panes for ide

if [ "$#" -eq 0 ]; then
  tmux split-window -v
  tmux split-window -h
  tmux resize-pane -D 15
  tmux select-pane -t 1
else
  case $1 in
    1)
      tmux split-window -v
      tmux resize-pane -D 15
      tmux select-pane -D
      clear
      ;;
    2)
      tmux split-window -h
      tmux split-window -v
      tmux resize-pane -D 15
      tmux select-pane -t 1
      tmux split-window -v
      tmux select-pane -t 1
      clear
      ;;
    3)
      tmux split-window -v
      tmux split-window -v
      tmux split-window -h
      tmux select-pane -t 1
      tmux split-window -h
      tmux select-pane -t 2
      tmux split-window -h
      tmux select-pane -t 1
      tmux split-window -h
      tmux select-pane -t 5
      tmux split-window -h
      tmux select-pane -t 7
      tmux split-window -h
      tmux resize-pane -y 12 -t 1
      tmux resize-pane -y 12 -t 2
      tmux resize-pane -y 12 -t 3
      tmux resize-pane -y 12 -t 4
      tmux resize-pane -y 12 -t 5
      tmux resize-pane -y 12 -t 6
      tmux resize-pane -y 12 -t 7
      tmux resize-pane -y 12 -t 8
      tmux select-pane -t 0
      tmux resize-pane -D 10
      clear
      ;;
    py)
      cd ~/Desktop/python
      tmux split-window -v
      tmux split-window -h
      tmux resize-pane -D 15
      tmux select-pane -t 1
      vi .
      clear
      ;;
    *)
      echo [ERROR] "$1" は設定されていない引数です。
      ;;
  esac
fi
