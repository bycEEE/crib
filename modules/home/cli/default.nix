{
  isWsl,
  lib,
  pkgs,
  nix-colors,
  ...
}:
/*
home-manager configuration
Useful links:
- Home Manager Manual: https://nix-community.gitlab.io/home-manager/
- Appendix A. Configuration Options: https://nix-community.gitlab.io/home-manager/options.html
*/
{
  imports = [
    nix-colors.homeManagerModules.default
    ./atuin.nix
    ./bat.nix
    ./bottom.nix
    # ./carapace.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./htop.nix
    ./go.nix
    # ./gpg.nix
    ./lsp.nix
    ./navi.nix
    # ./python.nix
    ./skim.nix
    ./ssh.nix
    # ./neovim.nix
    ./shell.nix
    ./starship.nix
    ./tealdeer.nix
    ./vim.nix
    ./zellij.nix
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-macchiato;
  home = {
    packages = with pkgs;
      [
        ### Nix Tools
        cachix # Command line client for Nix binary cache hosting
        # comma # Runs programs without installing them
        # deadnix # Find and remove unused code in .nix source files
        # devenv # A tool to create development environments
        # lorri # Fast, persistent and reliable development environment for the Nix ecosystem
        # nix-init # Generate Nix packages from URLs
        nix-output-monitor # Pipe your nix-build output through the nix-output-monitor (aka nom) to get additional information while building.
        # nix-prefetch # A tool to fetch and hash Nix derivations
        nix-prefetch-git # A tool to fetch and hash git repositories
        nix-prefetch-github # A tool to fetch and hash GitHub repositories
        nix-tree # Visualize the dependency graph of a Nix derivation
        nixos-generators # Turns configuration into outputs in different formats
        # nixpkgs-review # A tool for reviewing nixpkgs pull requests
        nurl # Generate Nix fetcher calls from repository URLs
        # nvfetcher # Generate nix sources expr for the latest version of packages
        # poetry2nix # Convert poetry.lock to nix
        # statix # Lints and suggestions for the nix programming language

        ### Linux
        # busybox # Tiny versions of common UNIX utilities in a single small executable
        # cmake # Cross-platform, open-source build system generator
        # coreutils
        curl
        findutils
        gawk
        # gcc
        gnugrep
        gnumake
        gnupg
        gnused
        # openssh
        rclone
        tree
        treefmt
        # uutils-coreutils-noprefix # Cross-platform Rust rewrite of the GNU coreutils
        xclip
        wget

        ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
        libxslt # A C library and tools to do XSL transformations

        ### Terminal
        bandwhich # Terminal bandwidth utilization tool
        # boxxy # Puts bad Linux applications in a box with only their files
        broot # A new way to see and navigate directory trees
        btop # A monitor of resources
        # catimg # Insanely fast image printing in your terminal
        # chafa # Terminal graphics for the 21st century
        # chroma # A general purpose syntax highlighter in pure Go
        duf # Disk Usage/Free Utility - a better 'df' alternative
        choose # A human-friendly and fast alternative to cut and (sometimes) awk
        du-dust # A more intuitive version of du in rust
        fd # A simple, fast and user-friendly alternative to find.
        fx # Terminal JSON viewer
        hyperfine # A command-line benchmarking tool
        # jql # A JSON query language tool built with Rust
        mmv # Move/Copy/Append/Link multiple files according to a set of wildcard patterns
        moar # Pager designed to just do the right thing without any configuration
        ncdu # NCurses Disk Usage
        ncurses # A free software emulation of curses
        ov # Feature-rich terminal-based text viewer
        procs # A modern replacement for ps written in Rust
        riffdiff # Riff is a wrapper around diff that highlights which parts of lines have changed.
        sd # Intuitive find & replace CLI (sed alternative)
        silver-searcher # `ag` A code searching tool similar to ack, but faster.
        sshfs # A filesystem client based on the SSH File Transfer Protocol
        tmux # A terminal multiplexer
        xdg-ninja # A shell script which checks your $HOME for unwanted files and directories
        vivid # A themeable LS_COLORS generator with a rich filetype datebase
        viu # A command-line application to view images from the terminal written in Rust
        # watchman # A file watching service
        yq

        ### Development
        # asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
        devbox # A tool for creating isolated development environments using Nix
        # difftastic # A syntax-aware diff
        # git-oxide # An idiomatic, lean, fast & safe pure Rust implementation of Git
        hugo # A fast and modern static website engine
        just # A handy way to save and run project-specific commands
        # lefthook # Fast and powerful Git hooks manager for any type of projects
        ngrok # Allows you to expose a web server running on your local machine to the internet
        postgresql_14
        pre-commit # A framework for managing and maintaining multi-language pre-commit hooks

        # ruff # An Extremely fast Python linter
        shellcheck # Shell script analysis tool
        sqlite
        # tokei # A program that displays statistics about your code
        yq

        ### Network
        # bore-cli # Rust tool to create TCP tunnels
        curlie # The power of curl, the ease of use of httpie
        dogdns # A command-line DNS client
        dnspeep # A network debugging tool for DNS
        httpie # A Modern command line HTTP client
        iftop # Display bandwidth usage on an interface
        ipinfo # A command-line tool that brings you the IP address information
        mtr # A network diagnostic tool
        # nethogs # A small 'net top' tool
        nettools # A collection of useful network tools
        prettyping # A wrapper around the standard ping tool with the objective of making the output prettier, more colorful, more compact, and easier to read
        rustscan # A modern replacement for nmap
        sniffnet # Cross-platform application to monitor your network traffic with ease
        trippy # A traceroute visualizer built with Rust and WebAssembly

        ### Utilities
        # aspellDicts.en # English dictionary for aspell
        clipboard-jh # Cut, copy, and paste anything, anywhere, all from the terminal
        croc # Easily and securely send things from one computer to another
        eget # Easily install prebuilt binaries from GitHub
        # gdu # Disk usage analyzer with console interface written in Go (clashes with git alias)
        # gitui # Blazing fast terminal-ui for git written in rust
        glow # Render markdown on the CLI, with pizzazz!
        graphviz # Graph Visualization Software
        # lazygit # Simple terminal UI for git commands
        lnav # The Log File Navigator
        # magic-wormhole-rs # Rust implementation of Magic Wormhole, with new features and enhancements
        # nali # A tool to display the location of an IP address
        neofetch # A fast, highly customizable system info script
        noti # Trigger notifications when a process completes
        ouch # A command-line utility for easily compressing and decompressing files and directories
        pueue # A daemon for managing long running shell commands
        ranger # A VIM-inspired filemanager for the console
        speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
        sshfs # A filesystem client based on the SSH File Transfer Protocol
        # translate-shell # Command-line translator using Google Translate, Bing Translator, Yandex.Translate, etc
        # zeal # Offline documentation browser inspired by Dash
        zk # A plain text note-taking assistant for managing your Zettelkasten

        ### Security
        _1password # 1Password CLI
        age # Modern encryption tool with small explicit keys
        git-secrets # Prevents you from committing secrets and credentials into git repositories
        sops # Editor of encrypted files that supports YAML, JSON, ENV, INI and BINARY formats and encrypts with AWS KMS, GCP KMS, Azure Key Vault and PGP
        # tailscale # The easiest, most secure way to use WireGuard and 2FA
        trivy # A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI
        trufflehog # Searches through git repositories for secrets, digging deep into commit history and branches

        ### TODO: Categorise
        brotli # Generic-purpose lossless compression algorithm

        ### Misc
        # inherit (pkgs.gitAndTools) gh;
        # inherit (inputs'.agenix.packages) agenix;
        # inherit (inputs'.statix.packages) statix;
      ]
      ++ (lib.lists.optionals (pkgs.system == "x86_64-linux") [
        # https://github.com/NixOS/nixpkgs/issues/222991
        # _1password-gui
        hollywood # A cli tool that turns your terminal into a Hollywood technical melodrama
        iotop-c # A top-like utility for I/O
        lurk # A simple and pretty alternative to strace
        nix-du # Disk usage analyzer for Nix store paths
        # openssl
        # openssh
        psmisc # A set of tools that use the proc filesystem
        showmethekey # A tool to show the keybindings of your terminal
        traceroute # A tool for tracing the route of IP packets
      ])
      ++ (lib.lists.optionals (pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin") [
        asitop # Performance monitoring CLI tool for Apple Silicon
        dockutil # Command line tool for managing dock items
      ])
      ++ (lib.lists.optionals isWsl) [
        socat # Utility for bidirectional data transfer between two independent data channels, for 1Password SSH agent
        wslu # Windows Subsystem for Linux utilities
        wsl-open # Open files in Windows from WSL
      ];

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      PAGER = "moar";
      MOAR = "--style=catppuccin-macchiato";
      DISPLAY = ":0";
      # NODE_PATH = "${NODE_GLOBAL}/lib";
      # JAVA_HOME = "${pkgs.jdk11}";
      # PNPM_HOME = "${PNPM_DIR}";
    };
  };

  programs = {
    home-manager.enable = true;
    home-manager.path = lib.mkDefault "$HOME/crib";
    # dircolors = {
    #   enable = true;
    #   enableZshIntegration = config.programs.zsh.enable;

    #   extraConfig = __readFile (pkgs.fetchurl {
    #     url = "https://raw.githubusercontent.com/trapd00r/LS_COLORS/eeceec887830e1b30b49b08371ae0d079578a58a/LS_COLORS";
    #     hash = "sha256-Y8HrlS5thtXlRNtxefCIgWSD+vnW1bgpqf0Q88hW2s8=";
    #   });
    # };

    jq.enable = true;
    less.enable = true;
    nix-index.enable = true;
    nix-index-database.comma.enable = true;
    pandoc.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
