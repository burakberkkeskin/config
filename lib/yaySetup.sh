#!/bin/bash

checkYay(){
  title "Checking yay"
  if ! command -v yay &> /dev/null; then
    warn "Yay not found, installing yay."
    return 1
  else
    info "Yay found on the system."
  fi
}

installYay(){
  title "Yay installation"

  info "Clonning yay repository."
  git clone https://aur.archlinux.org/yay.git
  chown -R  "$USER:$USER" yay
	cd yay || exit 1

  info "Installing yay with makepkg."
  makepkg -si --noconfirm
  cd .. || exit 1
  rm -rf yay
}