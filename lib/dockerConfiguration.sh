#!/bin/bash

configureSystemdService(){
  sudo systemctl start docker
  sudo systemctl enable docker
}

configureDockerPermission(){
  sudo groupadd docker || echo "Docker group already exists"
  sudo usermod -aG docker "${USER}"
}

configureDocker(){
  title "Configuring Docker"
  configureSystemdService
  configureDockerPermission
}