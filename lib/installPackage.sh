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
  curl  -sSf https://sh.rustup.rs | sh -s -- -y
}

installOhMyZsh(){
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

installInfracost(){
  curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
}