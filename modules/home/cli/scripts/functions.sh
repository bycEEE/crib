function is_wsl() {
  # /proc doesn't exist on macOS; WSL kernels report "microsoft" in /proc/version
  [[ -r /proc/version && "$(</proc/version)" == *(microsoft|Microsoft|WSL)* ]]
}

function is_linux() {
  [[ "$OSTYPE" == linux* ]]
}

function is_darwin() {
  [[ "$OSTYPE" == darwin* ]]
}

# Swap two files
function swap() {
  if [[ $# -ne 2 || ! -e "$1" || ! -e "$2" ]]; then
    echo "usage: swap <file1> <file2> (both must exist)" >&2
    return 1
  fi
  if [[ -e "$1.tmp" ]]; then
    echo "swap: $1.tmp already exists, refusing to overwrite" >&2
    return 1
  fi
  mv "$1" "$1.tmp" && mv "$2" "$1" && mv "$1.tmp" "$2"
}

# Start a fresh shell (re-sourcing .zshrc in place re-runs every plugin/hook)
function reload() {
  exec zsh
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
  local hist="${HISTFILE:-$HOME/.config/zsh/zsh_history}"
  mv "$hist" "$hist.bad" || return 1
  strings "$hist.bad" >"$hist" && fc -R "$hist" && rm "$hist.bad"
}

function print_path_newline() {
  echo "${PATH//:/$'\n'}"
}

# Run work commands
function work_login() {
  aws sso login --profile infra
}

# Drop cache in WSL
function drop_cache() {
  sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
}
