#!/bin/bash

while IFS=' = ' read -r src dest; do
  [[ -z $src ]] && continue

  dest="${dest/#\~/$HOME}"
  echo "$dest"

  ln -sf "$(pwd)/$src" "$dest" && echo "Linked $src -> $dest"
done < MANIFEST
