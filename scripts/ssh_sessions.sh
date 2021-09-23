#!/usr/bin/env bash
# ssh_sessions.sh
#
# Description:
#   Create or recreate tmux-panes in one tmux-window of the current tmux-session
#   according to the number of servers given, and batch ssh these remote servers
#   in these tmux-panes.
#
# Bin Name: ssh-sessions
#
# Author: noone <https://github.com/windvalley>

usage() {
    cat <<-EOF
Usage:
    ssh-sessions /yourpath/window_name[.extension_name]

Content format of /yourpath/window_name[.extension_name]:
    node1.example.com
    node2.example.com
    node3.exmaple.com
    ...

Note:
    Make sure the servers in /yourpath/window_name.extension_name 
    can login without password by ssh public key authentication.

Examples:
    $ ssh-sessions ~/.xxxservers.ssh

    or

    $ ssh-sessions ~/.xxxservers

    or

    $ ssh-sessions ~/xxxservers
EOF
    exit 1
}

SSH_SERVERS_FILE=$1
OMIT_CONTENT_PATTERN='#|//|"|--|^$'

[[ ! -s "$SSH_SERVERS_FILE" ]] && usage

grep -Ev "$OMIT_CONTENT_PATTERN" "$SSH_SERVERS_FILE" | grep -Eq '[^0-9a-zA-Z.-]' && usage

SERVERS=$(grep -Ev "$OMIT_CONTENT_PATTERN" "$SSH_SERVERS_FILE")
# Default: NULL -- means the current tmux session
SESSION_NAME=
WINDOW_NAME=$(echo "$SSH_SERVERS_FILE" | awk -F/ '{print $NF}' |
    awk -F. '{print $(NF-1)}')
PANE_COUNT=$(echo "$SERVERS" | xargs -n1 | grep -c .)

[[ -z "$WINDOW_NAME" ]] && {
    WINDOW_NAME=$(echo "$SSH_SERVERS_FILE" | awk -F/ '{print $NF}' | sed 's/^.//')
}

tmux kill-window -t "$SESSION_NAME:$WINDOW_NAME" 2>/dev/null

tmux new-window -n "$WINDOW_NAME" -d

for i in $(seq 2 "$PANE_COUNT"); do
    tmux split-window -t "$SESSION_NAME:$WINDOW_NAME"
    tmux select-layout -t "$SESSION_NAME:$WINDOW_NAME" even-vertical
done

tmux select-layout -t "$SESSION_NAME:$WINDOW_NAME" tiled

pane_id=1
for i in $SERVERS; do
    tmux send-keys -t "$SESSION_NAME:$WINDOW_NAME".$pane_id "ssh $i" C-m
    ((pane_id++))
done

exit 0
