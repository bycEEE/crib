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
    defaultOptions = ["--height 100%"];
    fileWidgetCommand = "${defaultCommand}";
    fileWidgetOptions = [
      "--preview '${bat} --color=always --paging=never --plain --line-range=:200 {}'"
    ];
    changeDirWidgetCommand = "${fd} -H --type d";
    changeDirWidgetOptions = [
      "--preview '${tree}/bin/tree -C {} | head -200'"
    ];
    historyWidgetOptions = [];
  };
}
