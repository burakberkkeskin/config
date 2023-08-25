#!/bin/bash

error() {
  echo -e "\033[31mERROR: $*\033[0m"
}

success() {
  echo -e "\033[32mSUCCESS: $*\033[0m"  
}

warn() {
  echo -e "\033[33mWARNING: $*\033[0m"
}

info() {
  echo -e "\033[34mINFO: $*\033[0m"
}

title(){
  echo
  echo -e "\033[35m##### $* #####\033[0m"
}