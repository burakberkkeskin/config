#!/bin/bash

archSystemUpdate(){
  info "Updating packages."
  sudo pacman -Syyu --noconfirm
}

updateSystem(){
  title "Updating system"
  archSystemUpdate
}