#!/bin/bash

checkBaseDevel(){
  if ! command -v gitt &> /dev/null; then
    warn "Base-Devel not found, installing git."
    return 1
  else
    info "Base-Devel found on the system."
  fi
}

installBaseDevelPacman(){
  info "Installing base-devel with pacman."
  # sudo pacman -S --needed base-devel --noconfirm
}

installGit(){
  title "Base-devel installation"
  installBaseDevelPacman
}