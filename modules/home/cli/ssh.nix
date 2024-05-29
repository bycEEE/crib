{
  isVm,
  lib,
  pkgs,
  ...
}: let
  ssh_auth_sock =
    if pkgs.stdenvNoCC.isDarwin
    then "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else "~/.ssh/agent.sock";
in {
  programs.ssh = {
    enable = true;
    # forwardAgent = true;
    serverAliveInterval = 20;
    serverAliveCountMax = 180;
    extraConfig = ''
      PreferredAuthentications publickey,password
    '';
  };
}
