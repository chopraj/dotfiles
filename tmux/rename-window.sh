#!/bin/sh

name=$(FZF_DEFAULT_OPTS='' FZF_DEFAULT_OPTS_FILE='' /opt/homebrew/bin/fzf \
  --query='' \
  --layout=reverse \
  --border=none \
  --padding=1,2 \
  --info=hidden \
  --no-separator \
  --prompt='' \
  --color='bg:-1,fg:#fafafa' \
  --bind='enter:accept-or-print-query,esc:abort' </dev/null) || exit 0

[ -n "$name" ] || exit 0
tmux rename-window -t "$1" -- "$name"
