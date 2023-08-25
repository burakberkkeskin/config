#!/bin/bash

source lib/log.sh
source lib/systemUpdate.sh
source lib/gitSetup.sh
source lib/yaySetup.sh
source lib/installPackageWithYay.sh

main(){
  distro=$(detectDistro)
  echo "$distro"
  title "Setup starting for Arch Linux"
  updateSystem
  checkGit || installGit
  checkYay || installYay
  installPackageWithYay "vim" "firefox" "vlc"
}

main