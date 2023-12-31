function is_wsl() {
  if [[ "$(</proc/sys/kernel/ostype)" != Linux ]]; then
    return 1 # WSL uses linux
  elif [[ "$(</proc/version)" == *@(Microsoft|WSL) ]]; then
    return 0 # WSL detected
  else
    return 1 # Not running on WSL
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

#Swap two files
function swap() {
  [ -e "$1.tmp" ] && return
  mv "$1" "$1.tmp"
  mv "$2" "$1"
  mv "$1.tmp" "$2"
}

function reload() {
  source $HOME/.config/zsh/.zshrc
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
  mv "$HOME/.config/zsh/zsh_history" "$HOME/.config/zsh/zsh_history_bad"
  strings "$HOME/.config/zsh/zsh_history_bad" >"$HOME/.config/zsh/zsh_history"
  fc -R "$HOME/.config/zsh/zsh_history"
  rm "$HOME/.config/zsh/zsh_history_bad"
}

function print_path_newline() {
  echo "${PATH//:/$'\n'}"
}

# Set window title
function precmd() {
  echo -ne "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}

# Run work commands
function work_login() {
  aws sso login --profile infra
}

# Drop cache in WSL
function drop_cache() {
  sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
}
