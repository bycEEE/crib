# copied from https://github.com/okkdev/dotnix/blob/02ba7328c2947aaacea48acd6d717e4c7dc84ee8/home/homebrew.nix
{
  config,
  pkgs,
  lib,
  ...
}: let
  taps = [
    "homebrew/bundle"
    "homebrew/cask"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/core"
  ];

  brews = [
  ];

  casks = [
  ];

  fonts = [
    # "font-fira-code"
    # "font-fira-code-nerd-font"
    # "font-hack"
    # "font-hack-nerd-font"
    # "font-iosevka"
    # "font-iosevka-nerd-font"
    # "font-jetbrains-mono"
    # "font-jetbrains-mono-nerd-font"
    # "font-terminus"
    # "font-terminess-ttf-nerd-font"
  ];

  mas = [
    # {
    #   name = "WireGuard";
    #   id = "1451685025";
    # }
    # {
    #   name = "Unsplash Wallpapers";
    #   id = "1284863847";
    # }
  ];
in
  with lib; {
    home.sessionPath = ["/opt/homebrew/bin"];

    home.file.".Brewfile" = {
      text =
        (concatMapStrings
          (tap: ''tap "'' + tap + "\"\n")
          taps)
        + (concatMapStrings
          (brew: ''brew "'' + brew + "\"\n")
          brews)
        + (concatMapStrings
          (cask: ''cask "'' + cask + "\"\n")
          casks)
        + (concatMapStrings
          (font: ''cask "font-'' + font + "\"\n")
          fonts)
        + (concatMapStrings
          ({
            name,
            id,
          }:
            ''mas "'' + name + ''", id: '' + id + "\n")
          mas);
      onChange = ''
        /opt/homebrew/bin/brew bundle install --cleanup --verbose --no-upgrade --force --no-lock --global
      '';
    };
  }
