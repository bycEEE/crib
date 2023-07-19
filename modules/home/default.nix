{
  isWsl,
  lib,
  ...
}:
/*
home-manager configuration
Useful links:
- Home Manager Manual: https://nix-community.gitlab.io/home-manager/
- Appendix A. Configuration Options: https://nix-community.gitlab.io/home-manager/options.html
*/
{
  home.stateVersion = "23.05";

  # home.activation = lib.mkIf isWsl {
  #   linkDesktopApplications = {
  #     after = ["writeBoundary" "createXdgUserDirectories"];
  #     before = [];
  #     data = ''
  #       rm -rf ${config.xdg.dataHome}/"applications/home-manager"
  #       mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
  #       cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
  #     '';
  #   };
  # };

  targets.genericLinux = lib.mkIf isWsl {
    enable = true;
  };

  # xdg.mime.enable = lib.mkIf isWsl true;

  # xdg.systemDirs.data = lib.mkIf isWsl [
  #   "${config.home.homeDirectory}/.nix-profile/share/applications"
  # ];
}
