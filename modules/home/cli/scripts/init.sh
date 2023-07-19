# Nix setup
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# Linux commands
# Start SSH agent
# if [[ "$OSTYPE" = "linux-gnu"* ]]; then
#   eval $(ssh-agent -s)
# fi

# Source brew
if [[ -d /opt/homebrew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# git installed asdf
export ASDF_DIR="$HOME/.asdf"

if [[ -d $ASDF_DIR ]]; then
  . "$ASDF_DIR/asdf.sh"
  . "$ASDF_DIR/completions/asdf.bash"
fi

# nix installed asdf
# if [[ -d "$HOME/.nix-profile/share/asdf-vm" ]]; then
#   . "$HOME/.nix-profile/share/asdf-vm/asdf.sh"
#   . "$HOME/.nix-profile/share/bash-completion/completions/asdf.bash"
# fi

# Set window title
function precmd () {
  echo -ne "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}

## Job Control
setopt long_list_jobs # Display PID when suspending processes as well.
setopt notify # Report the status of backgrounds jobs immediately.

## Set key bindings
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[1;3D" beginning-of-line # alt + left
bindkey "^[[1;3C" end-of-line # alt + right
bindkey "^H" backward-kill-word # ctrl + backspace
