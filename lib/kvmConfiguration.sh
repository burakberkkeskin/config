#!/bin/bash

configureSystemdService(){
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
}

configureKvm(){
  title "Configuring KVM"
  configureSystemdService
}