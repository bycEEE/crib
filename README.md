# bycEEE Nix Home

<p align="center">
  <a href="https://nixos.org#gh-light-mode-only">
    <img src="https://raw.githubusercontent.com/NixOS/nixos-homepage/master/logo/nixos-hires.png" width="500px" alt="NixOS logo"/>
  </a>
  <a href="https://nixos.org#gh-dark-mode-only">
    <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nixos-white.png" width="500px" alt="NixOS logo"/>
  </a>
</p>

## Status

Currently learning Nix, NixOS, Home Manager, Flakes, etc. This repo is intended for personal use only since I have no clue what I'm doing. Currently based on [kclejeune/system](https://github.com/kclejeune/system) and pieces slammed together from [inspirations](#inspirations).

## Features

### Main

- Manage my main user across WSL and MacOS.
- Uses 1Password SSH Agent.
- Personal and work profiles.

### Windows

- Utilises WSL to manage Windows 11 machine host.
- Manage host applications via bash scripts for [winget](https://winget.run/) and [scoop](https://scoop.sh/) (WIP).
- Configure host applications (WIP).
- Manage WSL GUI applications and have them show in host Start menu.

### MacOS

- Configure basic MacOS default preferences (WIP).
- [homebrew](https://brew.sh/) package management without NixOS.
- Bootleggedly manages application configuration for non nixpkgs applications such as iTerm2 and Karabiner.

## Installation

### Prerequisites

- [Enable and configure 1Password SSH agent](https://developer.1password.com/docs/ssh/get-started/).
- [Ensure Window's SSH agent service is not running](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent).

### WSL Setup

- Install and set up Ubuntu:

  ```sh
  wsl --install
  wsl -d Ubuntu # Start up Ubuntu
  wsl -s Ubuntu # Make default distribution
  ```

- Install Nix and Home Manager:

  ```sh
  # Determinate Systems Nix Installer
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf "trusted-users = root bchoy"

  # Create directory
  mkdir -p ~/crib
  cd ~/crib

  # Build and activate
  nix build "github:bycEEE/crib#homeConfigurations.bchoy@BREEZY.activationPackage" && ./result/activate

  # Clone the actual repo
  git clone git@github.com:bycEEE/crib.git .

  # Add nix installed shells to system (may have to edit files manually)
  # sudo echo "$HOME/.nix-profile/bin/bash" >> /etc/shells
  sudo echo "$HOME/.nix-profile/bin/zsh" >> /etc/shells

  # Change shell
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

### MacOS Setup

- If coming from brew:

  ```sh
  # Backup brew packages
  brew list -1 > .brew.backup
  brew bundle dump

  # Uninstall all packages
  brew uninstall --force $(brew list)

  # Fix broken links and clean up
  brew doctor
  brew cleanup
  brew cleanup -s
  ```

- Install brew:

  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
  ```

- Install Nix and Home Manager:

  Note: Haven't tried testing on a fresh system.

  Download [just](https://github.com/casey/just) binary.

  ```sh
  # Determinate Systems Nix Installer
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf "trusted-users = root bchoy brian.choy"

  git clone git@github.com:bycEEE/crib.git ~/crib
  just build

  # Add nix installed shells to system (may have to edit files manually)
  # sudo echo "$HOME/.nix-profile/bin/bash" >> /etc/shells
  sudo echo "$HOME/.nix-profile/bin/zsh" >> /etc/shells

  # Change shell
  chsh -s $HOME/.nix-profile/bin/zsh
  ```

## Resources

### Learning Nix

- [Zero to Nix](https://zero-to-nix.com/)
- [Nix Pills](https://nixos.org/guides/nix-pills/)
- [This Cute World](https://nixos-and-flakes.thiscute.world/introduction/)
- [myme.no NixOS Confederation](https://myme.no/posts/2022-06-14-nixos-confederation.html#wsl)
- [NixOS on WSL](https://forrestjacobs.com/nixos-on-wsl/)

### Useful Links

- [MyNixOS Package/Options Search](https://mynixos.com/)
- [NixOS Packages Search](https://search.nixos.org/packages)
- [DevBox Package Search](https://www.nixhub.io/)
- [NixOS Options Search](https://search.nixos.org/options)
- [NixOS Versioned Packages Search](https://lazamar.co.uk/nix-versions/)
- [Home Manager Options Search](https://mipmip.github.io/home-manager-option-search/)
- [Ayats Blog Posts](https://ayats.org/)
- [Minimal Nix Development Environment on WSL](https://cbailey.co.uk/posts/a_minimal_nix_development_environment_on_wsl)
- [1Password SSH Agent in WSL2](https://dev.to/d4vsanchez/use-1password-ssh-agent-in-wsl-2j6m)

### Inspirations

- [the-nix-way/nome](https://github.com/the-nix-way/nome) - Home Manager configuration and Nix functions/overlays for projects.
- [kclejeune/system](https://github.com/kclejeune/system) - Decoupled Home Manager configuration and Nix-Darwin examples.
- [ELD/nix-system](https://github.com/ELD/nix-system) - Same as kclejeune/system, but with custom personalisations.
- [totoroot/dotfiles](https://github.com/totoroot/dotfiles) - Multi platform with separated application examples and installation options.
- [matlob/nixpkgs](https://github.com/malob/nixpkgs)
- [vegaelle/nix-nvim](https://framagit.org/vegaelle/nix-nvim)
- [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
- [shaunsingh/nix-darwin-dotfiles](https://github.com/shaunsingh/nix-darwin-dotfiles)
- [nbdd0121/wsld](https://github.com/nbdd0121/wsld) WSL2 daemon for x11 and etc
- [yuanw/nix-home](https://github.com/yuanw/nix-home) Good MacOS readme. MacOS/Linux setups
- [akirak/home.nix](https://github.com/akirak/home.nix) wsl stuff
- [corps/nix-machines](https://github.com/corps/nix-machines) wsl stuff
- [fortuneteller2k/nix-config](https://github.com/fortuneteller2k/nix-config) wsl stuff, flake parts
- [viperML/dotfiles](https://github.com/viperML/dotfiles) flake parts
- [viperML/neoinfra](https://github.com/viperML/neoinfra/blob/master/flake.nix) flake parts infra
- [viperML/home-manager-wsl](https://github.com/viperML/home-manager-wsl)
- [matthew/nixdot](https://codeberg.org/matthew/nixdot) flake parts example
- [okpedersen/dotfiles](https://github.com/okpedersen/dotfiles) karabiner
- [zendo/nsworld](https://github.com/zendo/nsworld/blob/main/home-manager/cli.nix) - Organised apps
- [davisrichard437/nix-dotfiles](https://gitlab.com/davisrichard437/nix-dotfiles) - package building example
- [EdenEast/nyx](https://github.com/EdenEast/nyx)
- [rxyhn/yuki](https://github.com/rxyhn/yuki)
- [ambroisie/nix-config](https://git.belanyi.fr/ambroisie/nix-config)
- [okkdev/dotnix](https://github.com/okkdev/dotnix) - home manager homebrew example
