#!/usr/bin/env bash

checkVim() {
  if ! vim --version; then
    echo "Vim not found"
    return 1
  fi
}

configureVim() {
  cp ./configurations/.vimrc "${HOME}"
}
