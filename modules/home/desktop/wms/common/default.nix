{
  pkgs,
  inputs,
  lib,
  isVm,
  ...
}: {
  imports = [
    ./gtk.nix
    ./gammastep.nix
    ./kanshi.nix
    ./swaylock.nix
    ./waybar.nix
    ./wlogout.nix
    ./eww.nix
    ./scripts.nix
    ./xdg.nix

    ./notifications/swaync.nix
    ./launchers/rofi.nix
  ];

  home.sessionVariables =
    {
      MOZ_ENABLE_WAYLAND = 1;
      QT_QPA_PLATFORM = "wayland";
      LIBSEAT_BACKEND = "logind";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    }
    // lib.optionalAttrs isVm {
      WLR_RENDERER_ALLOW_SOFTWARE = 1;
      WLR_NO_HARDWARE_CURSORS = 1;
    };

  home.packages = with pkgs; [
    mplayer
    celluloid
    via
    mtpfs
    jmtpfs
    brightnessctl
    xdg-utils
    gnome.nautilus-python
    gnome.sushi
    gnome.nautilus
    gnome.gnome-disk-utility
    gnome.totem
    gnome.eog
    gnome.gvfs
    gnome-text-editor
    wl-clipboard
    pamixer
    playerctl
    sway-contrib.grimshot
    swaybg

    networkmanagerapplet
    inputs.nwg-displays.packages."${pkgs.system}".default
    nwg-look
  ];
}
