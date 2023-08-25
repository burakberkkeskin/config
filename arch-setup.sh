#!/bin/bash

source lib/log.sh
source lib/systemUpdate.sh
source lib/gitSetup.sh
source lib/yaySetup.sh
source lib/installPackageWithYay.sh
source lib/detectDistro.sh

main(){
  distro=$(detectDistro)
  echo "$distro"
  title "Setup starting for Arch Linux"
  updateSystem
  checkGit || installGit
  checkYay || installYay

  local testPackages=("wireguard" "zenv" "docker" "docker-compose")

  local clientPackages=("brave-bin" "discord_arch_electron" "spotify" "mailspring" 
      "flameshot" "kazam" "qbittorrent" "btop"
      "openvpn3" "wireguard-tools" "terminator"  
      "zsh")

  local developerPackages=("code" "vim" "dbeaver" 
        "docker" "docker-buildx" "docker-compose" 
        "kubectl" "act-bin" "ansible" "dive" 
        "aws-cli-v2" "postman-bin" "trivy" 
        "zenv" "xdman" "terraform")
  
  installPackageWithYay "${testPackages[@]}"
}

main