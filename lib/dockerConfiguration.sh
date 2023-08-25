#!/bin/bash

configureSystemdService(){
  sudo systemctl start docker
  sudo systemctl enable docker
}

configureDockerPermission(){
  sudo groupadd docker
  sudo usermod -aG docker $USER
}

configureDocker(){
  configureSystemdService
  configureDockerPermission
}