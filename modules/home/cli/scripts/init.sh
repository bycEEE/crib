# # Nix setup
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

# Exegol autocompletion
[[ $(command -v exegol) ]] && eval "$(register-python-argcomplete --no-defaults exegol)"

# # git installed asdf
# export ASDF_DIR="$HOME/.asdf"

# if [[ -d $ASDF_DIR ]]; then
#   . "$ASDF_DIR/asdf.sh"
#   . "$ASDF_DIR/completions/asdf.bash"
# fi

# nix installed asdf
# if [[ -d "$HOME/.nix-profile/share/asdf-vm" ]]; then
#   . "$HOME/.nix-profile/share/asdf-vm/asdf.sh"
#   . "$HOME/.nix-profile/share/bash-completion/completions/asdf.bash"
# fi
