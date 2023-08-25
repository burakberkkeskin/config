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
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

installOhMyZsh(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
}

installInfracost(){
  curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
}