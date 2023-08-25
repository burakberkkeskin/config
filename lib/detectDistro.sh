#!/bin/bash

detectDistro(){
  if [[ -f /etc/debian_version ]]; then
    if grep -qi "ubuntu" /etc/os-release; then
        echo "Ubuntu"
    else
        echo "Debian"
    fi

  # Detect Arch
  elif [[ -f /etc/arch-release ]]; then
      echo "Arch"

  # Detect Red Hat or CentOS or Fedora
  elif [[ -f /etc/redhat-release ]]; then
      if grep -qi "centos" /etc/redhat-release; then
          echo "CentOS"
      elif grep -qi "fedora" /etc/redhat-release; then
          echo "Fedora"
      else
          echo "RedHat"
      fi
  else
      echo "Unknown"
  fi
}

detectOs(){
    os=$(uname -s)
    if [[ "${os}" == "Linux" ]]; then
        detectDistro
    elif [[ "${os}" == "Darwin" ]]; then
        echo "MacOS"
    else
        echo "Unknown OS"
    fi
}

checkOs(){
    title "Checking OS"
    operatingSystem=$1
    info "Your operating system: $operatingSystem"
    if [[ "${operatingSystem}" == "Arch" ]]; then
        info "OS: Arch Linux Base"
    elif [[ "${operatingSystem}" == "MacOS" ]]; then
        error "MacOS is not supported for now."
        error "MacOS implementation will be done soon..."
        exit 1
    else 
        error "Your OS is not supported."
        error "This script supports just Arch linux for now."
        exit 1
    fi
}