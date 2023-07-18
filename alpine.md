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
