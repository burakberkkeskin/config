#!/bin/bash

installPackageWithYay(){
  title "Installing packages with yay"
  yay -S "${@}" --noconfirm 
}

installPackageWithPacman(){
  title "Installing packages with pacman"
  yay -S "${@}" --noconfirm
}

installRust(){
  title "Installing Rust"
  if ! command -v rustc &> /dev/null; then
    info "Downloading and installing rust"
    curl  -sSf https://sh.rustup.rs | sh -s -- -y
  else
    info "Rust already installed, skipping"
  fi
}

installOhMyZsh(){
  title "Installing OhMyZsh"
  if [ -d ~/.oh-my-zsh ]; then
    info "OhMyZsh already installed, skipping"
  else
    info "Downloading and installing OhMyZsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
}

installInfracost(){
  title "Installing Infracost"
  if ! command -v infracost &> /dev/null; then
    info "Downloading and installing infracost"
    curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
  else
    info "Infracost already installed, skipping"
  fi
  
}