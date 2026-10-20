#!/bin/sh
set -eu

file=$1
directory=$(dirname "$file")

while [ "$directory" != / ]; do
  for formatter in oxfmt prettier; do
    if [ -x "$directory/node_modules/.bin/$formatter" ]; then
      cd "$directory"
      exec "./node_modules/.bin/$formatter" --stdin-filepath "$file"
    fi
  done

  if [ -e "$directory/.git" ]; then
    # Thorin's root documentation uses the formatter installed in backend-service.
    if [ -f "$directory/.oxfmtrc.json" ] && [ -x "$directory/backend-service/node_modules/.bin/oxfmt" ]; then
      cd "$directory"
      exec ./backend-service/node_modules/.bin/oxfmt --ignore-path backend-service/.prettierignore --stdin-filepath "$file"
    fi
    break
  fi

  directory=$(dirname "$directory")
done

cat
