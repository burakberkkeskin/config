#!/bin/bash

checkGit(){
  if ! command -v git &> /dev/null; then
    warn "Git not found, installing git."
    return 1
  else
    info "Git found on the system."
  fi
}

installGitPacman(){
  info "Installing git with pacman."
  sudo pacman -S git --noconfirm
}

installGit(){
  title "Git installation"
  installGitPacman
}

configureKwalletForGit(){
  echo "GIT_ASKPASS=/usr/bin/ksshaskpass" >> "${HOME}/.zshrc"
}