{...}:
/*
home-manager configuration
Useful links:
- Home Manager Manual: https://nix-community.gitlab.io/home-manager/
- Appendix A. Configuration Options: https://nix-community.gitlab.io/home-manager/options.html
*/
{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) types mkOption;
in {
  home.stateVersion = "23.05";

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
        default = "wezterm";
      };

      browser = mkOption {
        type = types.nullOr (types.enum ["firefox"]);
        description = "The default browser to use";
        default = "firefox";
      };

      editor = mkOption {
        type = types.nullOr (types.enum ["vim" "code" "helix"]);
        description = "The default editor to use";
        default = "helix";
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
