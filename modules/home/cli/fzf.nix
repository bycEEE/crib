{
  pkgs,
  lib,
  ...
}: let
  fd = lib.getExe pkgs.fd;
  bat = lib.getExe pkgs.bat;
  tree = lib.getExe pkgs.tree;
in {
  programs.fzf = rec {
    enable = true;
    defaultCommand = "${fd} -H --type f -E .git";
    # ccatppuccin macchiato theme
    defaultOptions = [
      "--height 80%"
      "--layout=reverse"
      "--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796"
      "--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6"
      "--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
    ];
    fileWidget = {
      command = "${defaultCommand}";
      options = [
        "--preview '${bat} --color=always --paging=always --plain {}'"
      ];
    };
    changeDirWidget = {
      command = "${fd} -H --type d";
      options = [
        "--preview '${tree}/bin/tree -C -a {}'"
      ];
    };
    historyWidget = {
      command = "";
      options = [];
    };
  };
  catppuccin.fzf.enable = true;
}
