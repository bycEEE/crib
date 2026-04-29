{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.ssh = {
    enable = true;
    # forwardAgent = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        serverAliveCountMax = 180;
        serverAliveInterval = 20;
      };
    };
    extraConfig = ''
      PreferredAuthentications publickey,password
    '';
  };

  home.sessionVariables = lib.mkIf pkgs.stdenvNoCC.isDarwin {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };
}
