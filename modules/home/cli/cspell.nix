{
  config,
  pkgs,
  ...
}:
let
  # Live symlinks into the repo, so edits apply without a home-manager switch
  link =
    file:
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/crib/modules/home/cli/scripts/${file}";
in
{
  home.packages = with pkgs; [
    cspell # Spell checker for code
  ];

  # cspell uses the nearest config file above the file being checked, so ~ covers
  # everything under home that has no cspell config of its own.
  home.file.".cspell.config.yaml".source = link ".cspell.config.yaml";
  # The config refers to ./.cspell-personal.txt, resolved next to the symlink in ~
  home.file.".cspell-personal.txt".source = link ".cspell-personal.txt";
}
