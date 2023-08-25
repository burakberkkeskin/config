#!/bin/bash

source lib/log.sh
source lib/systemUpdate.sh
source lib/gitSetup.sh
source lib/baseDevelSetup.sh
source lib/yaySetup.sh
source lib/installPackage.sh
source lib/detectDistro.sh
source lib/dockerConfiguration.sh
source lib/kvmConfiguration.sh
source lib/ohmyzshConfiguration.sh

main(){

  # Check OS
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

  # Start of actual script
  title "Setup starting for ${operationSystem}"
  
  # Update packages
  updateSystem

  # Check git and base-devel (necessary packages)
  checkBaseDevel || installBaseDevel
  checkGit || installGit

  # Install yay package manager
  checkYay || installYay

  # List of packages to install from yay and pacman
  local testYayPackages=("wireguard-tools" "zenv" "docker" "docker-compose" "yay")

  local clientYayPackages=("brave-bin" "discord_arch_electron" "spotify" "mailspring"
      "flameshot" "kazam" "qbittorrent" "btop"
      "openvpn3" "wireguard-tools" "terminator"
      "zsh")

  local developerYayPackages=("code" "vim" "dbeaver"
        "docker" "docker-buildx" "docker-compose"
        "kubectl" "act-bin" "ansible" "dive"
        "aws-cli-v2" "postman-bin" "trivy"
        "zenv" "xdman8-bin" "terraform")

  local developerPacmanPackages=("nodejs" "npm" "python" "go" "kubectx")

  local kvmPackages=("archlinux-keyring" "qemu" "virt-manager" "virt-viewer" "dnsmasq" "vde2" "bridge-utils" "openbsd-netcat" "dmidecode" "iptables" "libguestfs")

  # Install packages with corresponding ways
  installPackageWithYay "${testYayPackages[@]}"
  installPackageWithYay "${clientYayPackages[@]}"
  installPackageWithYay "${developerYayPackages[@]}"

  installPackageWithPacman "${developerPacmanPackages[@]}"
  installPackageWithPacman "${kvmPackages[@]}"
  
  installRust
  installOhMyZsh
  installInfracost

  configureDocker
  configureKvm
  configureOhMyZsh

  success "Applications and configurations has been installed on your $operationSystem!"
  info "Please open a new terminal session for fresh start."
}

main