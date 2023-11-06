{
  isWsl,
  lib,
  pkgs,
  ...
}: let
  riff = lib.getExe pkgs.riffdiff;
in {
  home.packages = with pkgs; [
    github-cli
    # difftastic
  ];
  programs.git = {
    enable = true;
    extraConfig = {
      # credential.helper =
      #   if pkgs.stdenvNoCC.isDarwin
      #   then "osxkeychain"
      #   else "cache --timeout=1000000000";
      # core.autocrlf = "input";
      gpg.format = "ssh";
      "gpg \"ssh\"".program =
        if isWsl
        then "/mnt/c/Program Files/1Password/app/8/op-ssh-sign.exe"
        else if pkgs.stdenvNoCC.isDarwin
        then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
        else "\${pkgs.gnupg}/bin/gpg2";

      commit = {
        verbose = true;
        gpgsign = true;
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        default = "current";
        autoSetupRemote = true;
        # followTags = true;
      };

      pull = {
        rebase = false;
      };

      # fetch = {
      #   prune = true;
      # };

      pager = {
        diff = riff;
        show = riff;
        log = riff;
      };
      interactive.diffFilter = riff;
      http.sslVerify = true;
    };
    aliases = {
      ignore = "!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi";
      #   fix = "commit --amend --no-edit";
      #   oops = "reset HEAD~1";
      sub = "submodule update --init --recursive";
    };
    # difftastic = {
    #   enable = true;
    #   display = "inline";
    # };
  };
}
