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
source lib/vimSetup.sh

main() {
  operatingSystem=$(detectOs)
  checkOs "${operatingSystem}"
  # Start of actual script
  title "Setup starting for ${operatingSystem}"

  # Update packages
  updateSystem

  # Check git and base-devel (necessary packages)
  checkBaseDevel || installBaseDevel
  checkGit || installGit

  # Install yay package manager
  checkYay || installYay

  # List of packages to install from yay and pacman
  local clientYayPackages=("brave-bin" "discord_arch_electron" "spotify" "mailspring"
    "flameshot" "kazam" "qbittorrent" "btop"
    "openvpn3" "konsole" "wireguard-tools" "terminator"
    "wofi"  "rofi" "rofi-emoji" "zsh" "mako")

  local developerYayPackages=("code" "vim" "dbeaver"
    "docker" "docker-buildx" "docker-compose"
    "kubectl" "act-bin" "ansible" "dive"
    "aws-cli-v2" "postman-bin" "trivy"
    "zenv" "xdman8-bin" "terraform")

  local clientPacmanPackages=("neofetch")

  local developerPacmanPackages=("nodejs" "npm" "python" "go" "kubectx")

  local kvmPackages=("archlinux-keyring" "qemu" "virt-manager" "virt-viewer"
    "dnsmasq" "vde2" "bridge-utils" "openbsd-netcat"
    "dmidecode" "iptables" "libguestfs")

  # Install packages with corresponding ways
  installPackageWithYay "${clientYayPackages[@]}"
  installPackageWithYay "${developerYayPackages[@]}"

  installPackageWithPacman "${developerPacmanPackages[@]}"
  installPackageWithPacman "${clientPacmanPackages[@]}"
  installPackageWithPacman "${kvmPackages[@]}"

  installRust
  installOhMyZsh
  installInfracost

  configureDocker
  configureKvm
  configureOhMyZsh
  configureVim

  success "Applications and configurations has been installed on your $operatingSystem!"
  info "Please open a new terminal session for fresh start."
}

main
