{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) types mkOption;
in {
  options.my.settings = {
    default = {
      shell = mkOption {
        type = types.nullOr (types.enum ["${pkgs.zsh}/bin/zsh"]);
        description = "The default shell to use";
        default = "${pkgs.zsh}/bin/zsh";
      };

      terminal = mkOption {
        type = types.nullOr (types.enum ["wezterm"]);
        description = "The default terminal to use";
        default = "${pkgs.wezterm}/bin/wezterm";
      };

      browser = mkOption {
        type = types.nullOr (types.enum ["firefox"]);
        description = "The default browser to use";
        default = "firefox";
      };

      editor = mkOption {
        type = types.nullOr (types.enum ["vim" "code hx"]);
        description = "The default editor to use";
        default = "hx";
      };
    };

    wallpaper = mkOption {
      type = types.str;
      default = "";
      description = ''
        Wallpaper path
      '';
    };

    fonts = {
      regular = mkOption {
        type = types.str;
        description = "The font for regular text";
        default = "Agave Nerd Font";
      };

      monospace = mkOption {
        type = types.str;
        description = "The font for monospace text";
        default = "Hack Nerd Font Mono";
      };
    };
  };
}
