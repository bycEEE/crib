{
  pkgs,
  lib,
  config,
  nix-colors,
  nixgl,
  isVm,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
    ../modules/home/desktop/gnome
    # ../modules/home/desktop/wms/hyprland.nix
    # ../modules/home/desktop/wms/common
    ../modules/home/browsers/firefox.nix
    ../modules/home/terminals/wezterm.nix
  ];

  my.settings = {
    wallpaper = "~/Pictures/wallpapers/nixppuccin.png";
    default = {
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "wezterm";
      browser = "firefox";
      editor = "hx";
    };
  };

  colorScheme = nix-colors.colorSchemes.catppuccin-macchiato;

  # USE Gnome
  # To show nix installed apps in Gnome
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  xdg.systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications"];

  # xdg.configFile."autostart/tailscale.desktop".text = ''
  #   [Desktop Entry]
  #   Type=Application
  #   Exec=tailscale-systray
  #   Hidden=false
  #   NoDisplay=false
  #   X-GNOME-Autostart-enabled=true
  #   Comment[en_NG]=Start Tailscale Systray
  # '';

  # Remove 1Password ssh agent
  programs.ssh.extraConfig = "";

  # wayland.windowManager.hyprland.extraConfig = lib.mkAfter ''
  #   exec-once = /usr/libexec/geoclue-2.0/demos/agent
  #   exec-once = warp-taskbar

  #   bind=,XF86Launch5,exec,/usr/local/bin/swaylock -S
  #   bind=,XF86Launch4,exec,/usr/local/bin/swaylock -S
  #   bind=SUPER,backspace,exec,/usr/local/bin/swaylock -S
  # '';

  home.packages = with pkgs;
    [
    ]
    ++ (lib.lists.optionals isVm) [
      nixgl.nixGLIntel
    ];
  # home.packages = with pkgs; [
  #   podman-compose
  #   podman-tui
  # ];
}
