{config, ...}: let
  configPath = "${config.home.homeDirectory}/crib/modules/home/darwin/config";
in {
  imports = [
    ./preferences.nix
    # ./homebrew.nix
  ];

  xdg.configFile."iterm2/com.googlecode.iterm2.plist".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/iterm2/com.googlecode.iterm2.plist";
  xdg.configFile."karabiner".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/karabiner";
  xdg.configFile."linearmouse".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/linearmouse";
}