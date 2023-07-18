{
  description = "bycEEE WSL2/Darwin/Windows Configurations";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      # "https://nix-community.cachix.org"
      "https://byceee.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      # "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "byceee.cachix.org-1:rZTc0pkTozu+TV+SYKN3dkIsaI/7jrWvbe2fDeyjomI="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager";
    darwin.url = "github:lnl7/nix-darwin";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    darwin,
    home-manager,
    ...
  } @ inputs: let
    isDarwin = system: (builtins.elem system inputs.nixpkgs.lib.platforms.darwin);
    homePrefix = system:
      if isDarwin system
      then "/Users"
      else "/home";
    defaultSystems = [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    mkHomeConfig = {
      username,
      system ? "x86_64-linux",
      nixpkgs ? inputs.nixpkgs,
      isWsl ? false,
      baseModules ? [
        ./modules/home
        {
          home = {
            inherit username;
            homeDirectory = "${homePrefix system}/${username}";
            sessionVariables = {
              NIX_PATH = "nixpkgs=${nixpkgs}:stable=${inputs.stable}\${NIX_PATH:+:}$NIX_PATH";
            };
          };
        }
      ],
      extraModules ? [],
    }:
      inputs.home-manager.lib.homeManagerConfiguration rec {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = builtins.attrValues self.overlays;
        };
        extraSpecialArgs = {inherit self inputs nixpkgs isWsl;};
        modules = baseModules ++ extraModules;
      };
  in {
    homeConfigurations = {
      breezy = mkHomeConfig {
        isWsl = true;
        system = "x86_64-linux";
        username = "bchoy";
      };
    };
    overlays = {
      channels = final: prev: {
        # expose other channels via overlays
        stable = import inputs.stable {
          system = prev.system;
          config.allowUnfree = true;
        };
      };
      extraPackages = final: prev: {
      };
    };
  };
}
