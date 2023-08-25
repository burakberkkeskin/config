#!/bin/bash

installPackageWithYay(){
  title "Installing packages with yay"
  yay -S "$*" --noconfirm
}