#!/bin/bash

if [ "${1:-}" != "done" ] || [ -z "${TMUX:-}" ] || [ -z "${TMUX_PANE:-}" ]; then
  exit 0
fi

if ! ACTIVE_CLIENTS=$(tmux display-message -p -t "$TMUX_PANE" '#{window_active_clients}' 2>/dev/null); then
  exit 0
fi

if [ "$ACTIVE_CLIENTS" = "0" ]; then
  tmux set-option -w -t "$TMUX_PANE" @agent_done 1
fi

exit 0
