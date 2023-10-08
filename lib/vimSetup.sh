#!/usr/bin/env bash

checkVim() {
  if ! vim --version; then
    echo "Vim not found"
    return 1
  fi
}

configureVim() {
  title "Configuring Vim"
  cp ./configurations/.vimrc.basic "${HOME}/.vimrc"
}
