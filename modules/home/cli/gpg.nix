{
  lib,
  pkgs,
  ...
}: {
  programs.gpg = {
    enable = false;
    scdaemonSettings =
      {}
      // lib.optionalAttrs pkgs.stdenvNoCC.isDarwin {
        disable-ccid = true;
      };
  };

  # services = {
  #   gpg-agent.enableScDaemon =
  #     if pkgs.stdenvNoCC.isDarwin
  #     then false
  #     else true;
  #   gpg-agent.enableSshSupport = true;
  # };
}
