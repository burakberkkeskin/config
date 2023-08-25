#!/bin/bash

installPackageWithYay(){
  title "Installing packages with yay"
  command="yay -S $* --noconfirm"
  echo "${command}"
}