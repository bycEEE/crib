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
    defaultOptions = ["--height 50%"];
    fileWidgetCommand = "${defaultCommand}";
    fileWidgetOptions = [
      "--preview '${bat} --color=always --paging=always --plain {}'"
    ];
    changeDirWidgetCommand = "${fd} -H --type d";
    changeDirWidgetOptions = [
      "--preview '${tree}/bin/tree -C -a {}'"
    ];
    historyWidgetOptions = [];
  };
}
