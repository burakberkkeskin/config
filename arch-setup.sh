#!/bin/bash

source lib/log.sh
source lib/gitSetup.sh
source lib/yaySetup.sh
source lib/installPackageWithYay.sh

main(){
  title "Setup starting for Arch Linux"
  checkGit || installGit
  checkYay || installYay
  installPackageWithYay "vim" "firefox" "vlc"
}

main