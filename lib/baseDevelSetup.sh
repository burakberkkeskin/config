#!/bin/bash

installBaseDevelPacman() {
  info "Installing base-devel with pacman."
  sudo pacman -S --needed base-devel --noconfirm
}

installBaseDevel() {
  title "Base-devel installation"
  installBaseDevelPacman
}
