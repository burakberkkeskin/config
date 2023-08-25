#!/bin/bash

zshrcPath="${HOME}/.zshrc"

updatePluginsListZshrc(){
  # Define the new list of plugins to add
  newPlugins=("$@")

  # Read the current plugins line from the file
  currentPlugins=$(grep -oP 'plugins=\(\K[^)]+' "$zshrcPath")

  # Convert the current plugins to an array
  IFS=' ' read -ra current_plugins_array <<< "$currentPlugins"

  # Merge the current plugins and new plugins while removing duplicates
  mapfile -t mergedPlugins < <(printf "%s\n" "${current_plugins_array[@]}" "${newPlugins[@]}" | sort -u)

  # Generate the new plugins line
  newPluginsString="plugins=(${mergedPlugins[*]})"

  # Use sed to replace the old plugins line with the new one
  sed -i "s/plugins=(.*)/$newPluginsString/" "$zshrcPath"
}

updateZshTheme(){
  newThemeName=$1

  # Use sed to replace the old ZSH_THEME line with the new one
  sed -i "s/ZSH_THEME=\"[^\"]*\"/ZSH_THEME=\"$newThemeName\"/" "$zshrcPath"
  cp ./configurations/p10k.conf "${HOME}/.p10k.zsh"
}

installZshSyntaxHighligting(){
  info "Installing zsh syntax highligting"
  rm -rf "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  updatePluginsListZshrc "zsh-syntax-highlighting"
}

installZshAutoSuggestions(){
  info "Installing zsh auto suggestions"
  rm -rf "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  updatePluginsListZshrc "zsh-autosuggestions"
}

installPowerlevel10k(){
  info "Installing powerlevel10k theme"
  rm -rf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  updateZshTheme "powerlevel10k/powerlevel10k"
}

configureOhMyZsh(){
  title "Configuring OhMyZsh"
  installZshSyntaxHighligting
  installZshAutoSuggestions
  updatePluginsListZshrc "docker" "kubectl"
  installPowerlevel10k
}
