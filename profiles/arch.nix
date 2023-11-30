{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ../modules/home/desktop/gnome
    ../modules/home/desktop/hyprland
  ];

  config = {
    my.settings = {
      wallpaper = "~/Pictures/wallpapers/nixppuccin.png";
    };

    colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

    modules = {
      wms = {
        hyprland.enable = true;
      };
    };

    # USE Gnome
    # To show nix installed apps in Gnome
    targets.genericLinux.enable = true;
    xdg.mime.enable = true;
    xdg.systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications"];

    xdg.configFile."autostart/tailscale.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=tailscale-systray
      Hidden=false
      NoDisplay=false
      X-GNOME-Autostart-enabled=true
      Comment[en_NG]=Start Tailscale Systray
    '';

    # Work Laptop different email
    programs.ssh.extraConfig = "";

    wayland.windowManager.hyprland.extraConfig = lib.mkAfter ''
      exec-once = /usr/libexec/geoclue-2.0/demos/agent
      exec-once = warp-taskbar

      bind=,XF86Launch5,exec,/usr/local/bin/swaylock -S
      bind=,XF86Launch4,exec,/usr/local/bin/swaylock -S
      bind=SUPER,backspace,exec,/usr/local/bin/swaylock -S
    '';

    # home.packages = with pkgs; [
    #   podman-compose
    #   podman-tui
    # ];
  };
}
