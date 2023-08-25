#!/bin/bash

checkGit(){
  title "Checking git"
  if ! command -v gitt &> /dev/null; then
    warn "Git not found, installing git."
    return 1
  else
    info "Git found on the system."
  fi
}

installGitPacman(){
  info "Installing git with pacman."
  # sudo pacman -S git --noconfirm
}

installGit(){
  title "Installing git"
  installGitPacman
}