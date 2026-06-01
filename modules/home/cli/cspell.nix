{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cspell # Spell checker for code
  ];
  xdg.configFile."cspell/.cspell.config.yaml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/crib/modules/home/cli/scripts/.cspell.config.yaml";
}
