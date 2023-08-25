#!/bin/bash

detectDisto(){
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