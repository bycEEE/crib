{
  isWsl,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    extraConfig = {
      # credential.helper =
      #   if pkgs.stdenvNoCC.isDarwin
      #   then "osxkeychain"
      #   else "cache --timeout=1000000000";
      # core.autocrlf = "input";

      core = lib.mkIf isWsl {
        sshCommand = "ssh.exe";
      };

      gpg.format = "ssh";
      "gpg \"ssh\"".program =
        if isWsl
        then "/mnt/c/Users/bycEE/AppData/Local/1Password/app/8/op-ssh-sign.exe"
        else if pkgs.stdenvNoCC.isDarwin
        then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
        else "ssh-keygen";

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
        rebase = true;
      };

      # fetch = {
      #   prune = true;
      # };

      pager = {
        diff = lib.getExe pkgs.riffdiff;
        #   show = lib.getExe pkgs.riffdiff;
        #   log = lib.getExe pkgs.riffdiff;
      };
      interactive.diffFilter = lib.getExe pkgs.riffdiff;
      http.sslVerify = true;
    };

    aliases = {
      ignore = "!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi";
      #   fix = "commit --amend --no-edit";
      #   oops = "reset HEAD~1";
      sub = "submodule update --init --recursive";
    };

    difftastic = {
      enable = false;
      options = {
        display = "inline";
      };
    };
  };

  programs.gh.enable = true;
  programs.gh.settings.git_protocol = "ssh";
}
