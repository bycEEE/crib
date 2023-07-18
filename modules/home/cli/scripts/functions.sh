#!/usr/bin/env bash

function is_wsl() {
  if [[ "$(< /proc/sys/kernel/ostype)" != Linux ]]; then
    return 1 # WSL uses linux
  elif [[ "$(< /proc/version)" == *@(Microsoft|WSL) ]]; then
    return 0  # WSL detected
  else
    return 1  # Not running on WSL
  fi
}

function is_linux() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    return 0
  else
    return 1
  fi
}

function is_darwin() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  else
    return 1
  fi
}

function weather() {
  curl wttr.in/"$1"
}

# function config() {
#   # navigate to the config file for a specific app
#   cd "$XDG_CONFIG_HOME/$1" || echo "$1 is not a valid config directory."
# }

# function service() {
#   if [[ -z $1 ]]; then
#     echo "no command provided from [stop, start, restart]"
#     return 1
#   fi
#   if [[ -z $2 ]]; then
#     echo "No service name provided"
#     return 1
#   fi

#   service=$(launchctl list | awk "/$2/ {print $NF}")
#   if [[ $1 == "restart" ]]; then
#     launchctl stop "$service" && launchctl start "$service"
#   else
#     launchctl "$1" "$service"
#   fi
# }

function fix_zsh_history() {
  mv $HOME/.zsh_history $HOME/.zsh_history_bad
  strings $HOME/.zsh_history_bad > $HOME/.zsh_history
  fc -R $HOME/.zsh_history
  rm $HOME/.zsh_history_bad
}