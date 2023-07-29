{config, ...}: let
  configPath = "${config.home.homeDirectory}/crib/modules/home/darwin/config";
  libraryPath = "${config.home.homeDirectory}/Library";
in {
  imports = [
    ./preferences.nix
    # ./homebrew.nix
  ];
}
