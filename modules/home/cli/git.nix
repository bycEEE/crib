{
  isWsl,
  lib,
  pkgs,
  ...
}: let
  riff = lib.getExe pkgs.riffdiff;
in {
  home.packages = [
    pkgs.github-cli
    # pkgs.difftastic
  ];
  programs.git = {
    enable = true;
    userName = "Brian Choy";
    userEmail = "bycEEE@gmail.com";
    extraConfig = {
      # credential.helper =
      #   if pkgs.stdenvNoCC.isDarwin
      #   then "osxkeychain"
      #   else "cache --timeout=1000000000";
      # core.autocrlf = "input";
      commit.verbose = true;
      # fetch.prune = true;
      http.sslVerify = true;
      init.defaultBranch = "main";
      pull.rebase = false;
      push.default = "current";
      # pull.rebase = true;
      # push.followTags = true;
      # push.autoSetupRemote = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.program =
        if isWsl
        then "/mnt/c/Program Files/1Password/app/8/op-ssh-sign.exe"
        else if pkgs.stdenvNoCC.isDarwin
        then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
        else "gpg";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqeyKQGFLXGhNpu6RwFfbJdofRlfj0aLO0iVvWAyp52";
      pager.diff = "${riff}";
      pager.show = "${riff}";
      pager.log = "${riff}";
      interactive.diffFilter = "${riff}";
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
