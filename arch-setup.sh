#!/bin/bash

source lib/log.sh
source lib/systemUpdate.sh
source lib/gitSetup.sh
source lib/yaySetup.sh
source lib/installPackage.sh
source lib/detectDistro.sh

main(){
  operationSystem=$(detectOs)
  info "Your operating system: $operationSystem"
  if [[ "${operationSystem}" == "Arch" ]]; then
    info "OS: Arch Linux Base"
  elif [[ "${operationSystem}" == "MacOS" ]]; then
    error "MacOS is not supported for now."
    error "MacOS implementation will be done soon..."
    exit 1
  else 
    error "Your OS is not supported."
    error "This script supports just Arch linux for now."
    exit 1
  fi
  title "Setup starting for Arch Linux"
  updateSystem
  checkGit || installGit
  checkYay || installYay

  local testYayPackages=("wireguard-tools" "zenv" "docker" "docker-compose" "yay")

  local clientYayPackages=("brave-bin" "discord_arch_electron" "spotify" "mailspring" 
      "flameshot" "kazam" "qbittorrent" "btop"
      "openvpn3" "wireguard-tools" "terminator"  
      "zsh")

  local developerYayPackages=("code" "vim" "dbeaver" 
        "docker" "docker-buildx" "docker-compose" 
        "kubectl" "act-bin" "ansible" "dive" 
        "aws-cli-v2" "postman-bin" "trivy" 
        "zenv" "xdman" "terraform")

  local developerPacmanPackages=("nodejs" "npm" "python" "go")

  installPackageWithYay "${testYayPackages[@]}"
  installPackageWithYay "${clientYayPackages[@]}"
  installPackageWithYay "${developerYayPackages[@]}"

  installPackageWithPacman "${developerPacmanPackages[@]}"
  
  installRust
  installOhMyZsh
  installInfracost
}

main