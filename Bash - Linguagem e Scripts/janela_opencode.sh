#!/bin/bash
tmux new-session -d -c "$PWD" 'ranger --cmd="set viewmode multipane"' \; split-window -h -l 98% -c "$PWD" 'opencode .' \; attach-session

