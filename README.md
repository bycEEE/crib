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

- Download [AlpineWSL](https://github.com/yuk7/AlpineWSL/) and copy files to `C:\Virtual Machines\WSL\Alpine`.
- Install and set up Alpine:

  ```sh
  cd "C:\Virtual Machines\WSL\Alpine"
  .\Alpine.exe
  .\Alpine.exe run adduser -g bchoy bchoy
  .\Alpine.exe run addgroup bchoy root
  .\Alpine.exe run addgroup bchoy bin
  .\Alpine.exe run addgroup bchoy daemon
  .\Alpine.exe run addgroup bchoy sys
  .\Alpine.exe run addgroup bchoy adm
  .\Alpine.exe run addgroup bchoy disk
  .\Alpine.exe run addgroup bchoy wheel
  .\Alpine.exe run addgroup bchoy floppy
  .\Alpine.exe run addgroup bchoy dialout
  .\Alpine.exe run addgroup bchoy tape
  .\Alpine.exe run addgroup bchoy video
  .\Alpine.exe run apk update
  .\Alpine.exe run apk add --no-cache sudo curl shadow tzdata libstdc++
  .\Alpine.exe echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
  .\Alpine.exe echo 'Defaults exempt_group = wheel' >> /etc/sudoers.d/wheel
  .\Alpine.exe cat '/usr/share/zoneinfo/America/Los_Angeles' > /etc/localtime
  .\Alpine.exe config --default-user bchoy
  wsl -d Alpine # Start up Alpine
  wsl -s Alpine # Make default distribution
  ```

- Install Nix and Home Manager:

  ```sh
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --init none
  sudo chown -R bchoy:root /nix
  nix run nixpkgs#git clone https://github.com/bycEEE/crib ~/crib
  cd crib
  nix build "github:bycEEE/crib#homeConfigurations.breezy.activationPackage" && ./result/activate
  sudo echo "$(pwd)/.nix-profile/bin/bash" >> /etc/shells
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
-

### Useful Links

- [NixOS Packages Search](https://search.nixos.org/packages)
- [NixOS Options Search](https://search.nixos.org/options)
- [Home Manager Options Search](https://mipmip.github.io/home-manager-option-search/)
- [Ayats Blog Posts](https://ayats.org/)

### Unsorted Repositories

- <https://github.com/the-nix-way/nome>
- <https://github.com/totoroot/dotfiles>
- <https://github.com/kclejeune/system>
- <https://github.com/ELD/nix-system>
- <https://github.com/malob/nixpkgs>
- <https://cbailey.co.uk/posts/a_minimal_nix_development_environment_on_wsl>
- <https://framagit.org/vegaelle/nix-nvim>
- <https://github.com/zendo/nsworld/blob/main/home-manager/cli.nix> - organised apps
- <https://github.com/dustinlyons/nixos-config>

- <https://dev.to/d4vsanchez/use-1password-ssh-agent-in-wsl-2j6m> - WSL2 1Password
- <https://github.com/nbdd0121/wsld> WSL2 daemon for x11 and etc

- <https://github.com/okpedersen/dotfiles> karbiner
- <https://github.com/yuanw/nix-home> macos readme
- <https://github.com/akirak/home.nix> wsl stuff
- <https://github.com/corps/nix-machines> wsl stuff
- <https://github.com/fortuneteller2k/nix-config> wsl stuff
- <https://github.com/viperML/dotfiles> flake parts
- <https://github.com/viperML/neoinfra/blob/master/flake.nix> # flake parts infra
- <https://github.com/viperML/home-manager-wsl>
- <https://codeberg.org/matthew/nixdot> # flake parts example
