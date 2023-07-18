{
  config,
  isWsl,
  lib,
  pkgs,
  ...
}: let
  init = builtins.readFile ./scripts/init.sh;
  functions = builtins.readFile ./scripts/functions.sh;
  agent_bridge = builtins.readFile ./scripts/agent_bridge.sh;
  aliases = rec {
    # gst = "git status";
    # gap = "git add -p";
    # gcia = "git commit --amend --no-edit";
    # ls = "${pkgs.coreutils}/bin/ls --color=auto -h";
    # la = "${ls} -a";
    # ll = "${ls} -la";
    # lt = "${ls} -lat";
  };
in {
  programs.zsh = {
    enable = true;
    autocd = false;
    dotDir = ".config/zsh";
    localVariables = {
      LANG = "en_US.UTF-8";
      GPG_TTY = "/dev/ttys000";
      DEFAULT_USER = "${config.home.username}";
      CLICOLOR = 1;
      LS_COLORS = "ExFxBxDxCxegedabagacad";
      TERM = "xterm-256color";
    };
    shellAliases = aliases;
    initExtraBeforeCompInit = ''
      fpath+=~/.zfunc
    '';
    initExtra = ''
      ${init}
      ${functions}
      ${lib.optionalString isWsl ''
        ${agent_bridge}
      ''}
      # unset RPS1

      # preview directory's content with exa when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --group-directories-first --color=always $realpath'
    '';
    profileExtra = ''
      ${lib.optionalString pkgs.stdenvNoCC.isLinux "[[ -e /etc/profile ]] && source /etc/profile"}
    '';

    history = {
      share = false;
    };

    prezto = {
      enable = true;
      caseSensitive = false;
      color = true;
      extraModules = ["attr" "stat"];
      extraFunctions = ["zargs" "zmv"];
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "archive"
        "docker"
        "git"
        "homebrew"
        "osx"
        "autosuggestions"
        "syntax-highlighting"
        "history-substring-search"
        "command-not-found"
        # "gpg"
      ];
      editor = {
        keymap = "vi";
        dotExpansion = true;
        promptContext = true;
      };
      gnuUtility.prefix = "g";
      macOS.dashKeyword = "mand";
      terminal = {
        autoTitle = true;
        windowTitleFormat = "%n@%m: %s %d";
        tabTitleFormat = "%m: %s %d";
      };
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
    ];
  };
  programs.bash = {
    enable = true;
    shellAliases = aliases;
    initExtra = ''
      ${init}
      ${functions}
    '';
  };
}
