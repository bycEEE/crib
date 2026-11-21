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
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager";
    # darwin.url = "github:lnl7/nix-darwin";
    nix-index-database.url = "github:Mic92/nix-index-database";
    # agenix.url = "github:ryantm/agenix";
    # mystash.url = "git+ssh://git@github.com/bycEEE/stash.git?shallow=1";
    # mystash.flake = false;
    catppuccin.url = "github:catppuccin/nix";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    # agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    # darwin,
    home-manager,
    nix-index-database,
    # agenix,
    # mystash,
    catppuccin,
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
      baseModules ? [
        nix-index-database.homeModules.nix-index
        # nur.hmModules.nur
        # TODO: might need this
        # home-manager.darwinModules.home-manager
        ./modules/home
        ./modules/home/fonts
        ./modules/home/cli
        ./modules/home/apps
        catppuccin.homeModules.catppuccin
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
        # extraSpecialArgs = {inherit self inputs nixpkgs isWsl agenix mystash;};
        extraSpecialArgs = {inherit self inputs nixpkgs isWsl;};
        modules = baseModules ++ extraModules;
      };
  in {
    homeConfigurations = {
      "bchoy@Brians-MacBook-Pro" = mkHomeConfig {
        system = "aarch64-darwin";
        username = "bchoy";
        extraModules = [
          ./profiles/personal.nix
          ./profiles/devops.nix
          # ./profiles/pentesting.nix
          ./modules/home/darwin
          # ./modules/home/secrets
        ];
      };
      "brianchoy@Brian-Choy-MacBook-Pro" = mkHomeConfig {
        system = "aarch64-darwin";
        username = "brianchoy";
        extraModules = [
          ./profiles/work.nix
          ./profiles/devops.nix
          ./modules/home/darwin
          # ./modules/home/secrets
        ];
      };
      "bchoy@BREEZY" = mkHomeConfig {
        isWsl = true;
        system = "x86_64-linux";
        username = "bchoy";
        extraModules = [
          ./profiles/personal.nix
          ./profiles/devops.nix
          ./hosts/BREEZY.nix
          # ./profiles/pentesting.nix
          # ./modules/home/secrets
        ];
      };
      "icey@scheisty" = mkHomeConfig {
        system = "aarch64-linux";
        username = "icey";
        extraModules = [
          ./profiles/personal.nix
          ./profiles/pentesting.nix
        ];
      };
      "icey@fugazi" = mkHomeConfig {
        system = "x86_64-linux";
        username = "icey";
        extraModules = [
          ./profiles/personal.nix
          ./hosts/fugazi.nix
        ];
      };
    };
    overlays = {
      # channels = final: prev: {
      #   # expose other channels via overlays
      #   stable = import inputs.stable {
      #     system = prev.system;
      #     config.allowUnfree = true;
      #   };
      # };
      # nur = nur.overlay;
    };

    # `nix fmt` formats every .nix file in the repo with nixfmt (via treefmt)
    formatter =
      inputs.nixpkgs.lib.genAttrs ["aarch64-darwin" "x86_64-linux" "aarch64-linux"]
      (system: inputs.nixpkgs.legacyPackages.${system}.nixfmt-tree);
  };
}
