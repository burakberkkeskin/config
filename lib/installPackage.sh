#!/bin/bash

installPackageWithYay(){
  title "Installing packages with yay"
  yay -S "${@}" --noconfirm 
}

installPackageWithPacman(){
  title "Installing packages with pacman"
  yay -S "${@}" --noconfirm
}