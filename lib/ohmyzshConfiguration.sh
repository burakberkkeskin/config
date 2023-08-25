#!/bin/bash

updatePluginsListZshrc(){
  # Define the new list of plugins to add
  new_plugins=("$@")

  # Define the file path
  file_path=".zshrc"

  # Read the current plugins line from the file
  current_plugins=$(grep -oP 'plugins=\(\K[^)]+' "$file_path")

  # Convert the current plugins to an array
  IFS=' ' read -ra current_plugins_array <<< "$current_plugins"

  # Merge the current plugins and new plugins while removing duplicates
  mapfile -t merged_plugins < <(printf "%s\n" "${current_plugins_array[@]}" "${new_plugins[@]}" | sort -u)
  
  # Generate the new plugins line
  new_plugins_string="plugins=(${merged_plugins[*]})"

  # Use sed to replace the old plugins line with the new one
  sed -i "s/plugins=(.*)/$new_plugins_string/" "$file_path"

}

installZshSyntaxHighligting(){
  info "Installing zsh syntax highligting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  updatePluginsListZshrc "zsh-syntax-highlighting"
}

installZshAutoSuggestions(){
  info "Installing zsh auto suggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  updatePluginsListZshrc "zsh-autosuggestions"
}

configureOhMyZsh(){
  title "Configuring OhMyZsh"
  installZshSyntaxHighligting
  installZshAutoSuggestions
  updatePluginsListZshrc "docker" "kubectl"
}
