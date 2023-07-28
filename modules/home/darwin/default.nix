{config, ...}: let
  configPath = "${config.home.homeDirectory}/crib/modules/home/darwin/config";
  libraryPath = "${config.home.homeDirectory}/Library";
in {
  imports = [
    ./preferences.nix
    # ./homebrew.nix
  ];

  xdg.configFile."iterm2/com.googlecode.iterm2.plist".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/iterm2/com.googlecode.iterm2.plist";
  xdg.configFile."karabiner".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/karabiner";
  xdg.configFile."linearmouse".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/linearmouse";
  home.file."${libraryPath}/Preferences/com.raycast.macos.plist".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/raycast/com.raycast.macos.plist";
  home.file."${libraryPath}/Containers/cc.ffitch.shottr/Data/Library/Preferences/cc.ffitch.shottr.plist".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/shottr/cc.ffitch.shottr.plist";
}
