{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options.modules.wms.notifications.mako = {
    enable = mkEnableOption "enable mako notification manager";
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    backgroundColor = "#${config.colorscheme.palette.base00}";
    textColor = "#${config.colorscheme.palette.base05}";
    borderColor = "#${config.colorscheme.palette.base0D}";
    progressColor = "over #${config.colorscheme.palette.base02}";
    extraConfig = ''
      [urgency=high]
      border-color=#${config.colorscheme.palette.base09}
    '';
  };

  home.packages = with pkgs; [
    libnotify
  ];
}
