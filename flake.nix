{
  description = "bycEEE WSL2/Darwin/Windows Configurations";

  nixConfig = {
    commit-lockfile-summary = "flake: bump inputs";

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
    nix-index-database.url = "github:Mic92/nix-index-database";
    agenix.url = "github:ryantm/agenix";
    mystash.url = "git+ssh://git@github.com/bycEEE/stash.git?shallow=1";
    mystash.flake = false;
    # homeage.url = "github:jordanisaacs/homeage";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    darwin,
    home-manager,
    nix-index-database,
    agenix,
    mystash,
    ...
  } @ inputs: let
    isDarwin = system: (builtins.elem system inputs.nixpkgs.lib.platforms.darwin);
    homePrefix = system:
      if isDarwin system
      then "/Users"
      else "/home";

    # defaultSystems = [
    #   "aarch64-linux"
    #   "aarch64-darwin"
    #   "x86_64-darwin"
    #   "x86_64-linux"
    # ];

    mkHomeConfig = {
      username,
      system ? "x86_64-linux",
      nixpkgs ? inputs.nixpkgs,
      isWsl ? false,
      isVm ? false,
      baseModules ? [
        inputs.nix-index-database.hmModules.nix-index
        ./modules/home
        ./modules/home/fonts
        ./modules/home/cli
        ./modules/home/apps
        {
          home = {
            inherit username;
            homeDirectory = "${homePrefix system}/${username}";
            sessionPath = [
              "${homePrefix system}/${username}/.local/bin"
            ];
            sessionVariables = {
              NIX_PATH = "nixpkgs=${nixpkgs}:stable=${inputs.stable}\${NIX_PATH:+:}$NIX_PATH";
            };
          };
        }
      ],
      extraModules ? [],
    }:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = builtins.attrValues self.overlays;
        };
        extraSpecialArgs = {inherit self inputs nixpkgs isWsl isVm agenix mystash;};
        modules = baseModules ++ extraModules;
      };
  in {
    homeConfigurations = {
      "bchoy@Brians-MacBook-Pro" = mkHomeConfig {
        system = "aarch64-darwin";
        username = "bchoy";
        extraModules = [
          ./profiles/personal.nix
          ./modules/home/cli/devops.nix
          ./modules/home/darwin
          ./modules/home/secrets
        ];
      };
      "brianchoy@Brians-MacBook-Pro-Work" = mkHomeConfig {
        system = "aarch64-darwin";
        username = "brian.choy";
        extraModules = [
          ./profiles/work.nix
          ./modules/home/cli/devops.nix
          ./modules/home/darwin
          ./modules/home/secrets
        ];
      };
      "bchoy@BREEZY" = mkHomeConfig {
        isWsl = true;
        system = "x86_64-linux";
        username = "bchoy";
        extraModules = [
          ./profiles/personal.nix
          ./modules/home/cli/devops.nix
          ./modules/home/secrets
        ];
      };
      "icey@scheisty" = mkHomeConfig {
        isVm = true;
        system = "aarch64-linux";
        username = "icey";
        extraModules = [
          ./profiles/personal.nix
        ];
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
      kubectl = import ./overlays/kubectl.nix;
      extraPackages = final: prev: {
      };
    };
  };
}
