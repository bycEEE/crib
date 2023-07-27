# Nix Configurations

I initially managed my dotfiles using [mackup](https://github.com/lra/mackup).
This worked extremely well until I heard about Nix.

This repository is a testbed for learning Nix, NixOS, Flakes, and managing my
systems.

**Heavily based on the [kclejeune/system](https://github.com/kclejeune/system)
repo.**

Currently only used on my WSL setup.

## Prerequisites

- [Enable and configure 1Password SSH agent](https://developer.1password.com/docs/ssh/get-started/).
- [Ensure Window's SSH agent service is not running](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent).

## Installation

### WSL

- Install and set up Ubuntu:

  ```sh
  wsl --install
  wsl -d Ubuntu # Start up Ubuntu
  wsl -s Ubuntu # Make default distribution
  ```

- Install Nix and Home Manager:

  ```sh
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf "trusted-users = root bchoy"
  nix build "github:bycEEE/crib#homeConfigurations.bchoy@BREEZY.activationPackage" && ./result/activate
  git clone git@github.com:bycEEE/crib.git ~/crib
  # sudo echo "$(pwd)/.nix-profile/bin/bash" >> /etc/shells
  sudo echo "$(pwd)/.nix-profile/bin/zsh" >> /etc/shells
  chsh -s $(pwd)/.nix-profile/bin/zsh
  ```

- To enable GUI apps in Windows Start Menu:

  ```sh
  sudo ln -s $HOME/.nix-profile/share/applications /usr/local/share/applications
  sudo ln -s $HOME/.nix-profile/share/icons /usr/local/share/icons
  ```

- Subsequent runs:

  ```sh
  just apply
  ```

## MacOS

- If coming from brew:

  ```sh
  brew list -1 > .brew.backup
  brew uninstall --force $(brew list)
  brew doctor
  brew cleanup
  ```

- Install brew:

  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
  ```

- Install Nix and Home Manager:

  ```sh
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf "trusted-users = root bchoy"
  git clone git@github.com:bycEEE/crib.git ~/crib
  just build
  # sudo echo "$(pwd)/.nix-profile/bin/bash" >> /etc/shells
  sudo echo "$(pwd)/.nix-profile/bin/zsh" >> /etc/shells
  chsh -s $(pwd)/.nix-profile/bin/zsh
  ```

## Resources

### Learning Nix

- [Zero to Nix](https://zero-to-nix.com/)
- [Nix Pills](https://nixos.org/guides/nix-pills/)
- [This Cute World](https://nixos-and-flakes.thiscute.world/introduction/)
- [myme.no NixOS Confederation](https://myme.no/posts/2022-06-14-nixos-confederation.html#wsl)
- [NixOS on WSL](https://forrestjacobs.com/nixos-on-wsl/)

### Useful Links

- [NixOS Packages Search](https://search.nixos.org/packages)
- [NixOS Options Search](https://search.nixos.org/options)
- [Home Manager Options Search](https://mipmip.github.io/home-manager-option-search/)
- [Ayats Blog Posts](https://ayats.org/)
- [Minimal Nix Development Environment on WSL](https://cbailey.co.uk/posts/a_minimal_nix_development_environment_on_wsl)
- [1Password SSH Agent in WSL2](https://dev.to/d4vsanchez/use-1password-ssh-agent-in-wsl-2j6m)

### Inspirations

- [the-nix-way/nome](https://github.com/the-nix-way/nome) - Home Manager Config
- [kclejeune/system](https://github.com/kclejeune/system)
- [ELD/nix-system](https://github.com/ELD/nix-system)
- [totoroot/dotfiles](https://github.com/totoroot/dotfiles) - Multi Platform
- [matlob/nixpkgs](https://github.com/malob/nixpkgs)
- [vegaelle/nix-nvim](https://framagit.org/vegaelle/nix-nvim)
- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
- [shaunsingh/nix-darwin-dotfiles](https://github.com/shaunsingh/nix-darwin-dotfiles)

- [nbdd0121/wsld](https://github.com/nbdd0121/wsld) WSL2 daemon for x11 and etc
- [yuanw/nix-home](https://github.com/yuanw/nix-home) macos readme
- [akirak/home.nix](https://github.com/akirak/home.nix) wsl stuff
- [corps/nix-machines](https://github.com/corps/nix-machines) wsl stuff
- [fortuneteller2k/nix-config](https://github.com/fortuneteller2k/nix-config) wsl stuff, flake parts
- [viperML/dotfiles](https://github.com/viperML/dotfiles) flake parts
- [viperML/neoinfra](https://github.com/viperML/neoinfra/blob/master/flake.nix) flake parts infra
- [viperML/home-manager-wsl](https://github.com/viperML/home-manager-wsl)
- [matthew/nixdot](https://codeberg.org/matthew/nixdot) flake parts example
- [okpedersen/dotfiles](https://github.com/okpedersen/dotfiles) karbiner
- [zendo/nsworld](https://github.com/zendo/nsworld/blob/main/home-manager/cli.nix) - Organised apps
- [davisrichard437/nix-dotfiles](https://gitlab.com/davisrichard437/nix-dotfiles) - package building example
- [EdenEast/nyx](https://github.com/EdenEast/nyx)
- [rxyhn/yuki](https://github.com/rxyhn/yuki)
- [ambroisie/nix-config](https://git.belanyi.fr/ambroisie/nix-config)
- [okkdev/dotnix](https://github.com/okkdev/dotnix) - home manager homebrew example
