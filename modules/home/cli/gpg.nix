{
  lib,
  pkgs,
  ...
}:
{
  programs.gpg = {
    enable = false;
    scdaemonSettings =
      { }
      // lib.optionalAttrs pkgs.stdenvNoCC.hostPlatform.isDarwin {
        disable-ccid = true;
      };
  };

  # services = {
  #   gpg-agent.enableScDaemon =
  #     if pkgs.stdenvNoCC.hostPlatform.isDarwin
  #     then false
  #     else true;
  #   gpg-agent.enableSshSupport = true;
  # };
}
