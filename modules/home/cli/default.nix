{
  isWsl,
  lib,
  pkgs,
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
    ./atuin.nix
    ./aws.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./htop.nix
    ./go.nix
    # ./gpg.nix
    ./navi.nix
    # ./python.nix
    ./ssh.nix
    # ./neovim.nix
    ./shell.nix
    ./starship.nix
    ./tealdeer.nix
    ./vim.nix
    ./zellij.nix
  ];

  home = {
    packages = with pkgs;
      [
        ### Security
        _1password # 1Password CLI
        age # Modern encryption tool with small explicit keys
        git-secrets # Prevents you from committing secrets and credentials into git repositories
        sops # Editor of encrypted files that supports YAML, JSON, ENV, INI and BINARY formats and encrypts with AWS KMS, GCP KMS, Azure Key Vault and PGP
        # tailscale # The easiest, most secure way to use WireGuard and 2FA
        trivy # A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI
        trufflehog # Searches through git repositories for secrets, digging deep into commit history and branches

        ### Nix Tools
        alejandra # The Uncompromising Nix Code Formatter
        cachix # Command line client for Nix binary cache hosting
        # comma # Runs programs without installing them
        # deadnix # Find and remove unused code in .nix source files
        # devenv # A tool to create development environments
        # lorri # Fast, persistent and reliable development environment for the Nix ecosystem
        nil # Nix Language Server
        # nix-init # Generate Nix packages from URLs
        nix-output-monitor # Pipe your nix-build output through the nix-output-monitor (aka nom) to get additional information while building.
        nix-prefetch-git # A tool to fetch and hash git repositories
        nix-prefetch-github # A tool to fetch and hash GitHub repositories
        nix-tree # Visualize the dependency graph of a Nix derivation
        nixos-generators # Turns configuration into outputs in different formats
        nixpkgs-fmt # nix code formatter that would be applied on nixpkgs
        # nixpkgs-review # A tool for reviewing nixpkgs pull requests
        nurl # Generate Nix fetcher calls from repository URLs
        # nvfetcher # Generate nix sources expr for the latest version of packages
        # rnix-lsp # Language Server Protocol implementation for the Nix language
        # statix# Lints and suggestions for the nix programming language

        ### Linux
        # busybox # Tiny versions of common UNIX utilities in a single small executable
        cmake # Cross-platform, open-source build system generator
        coreutils
        curl
        fd
        findutils
        gawk
        gcc
        gnugrep
        gnumake
        gnupg
        gnused
        # openssh
        rclone
        ripgrep
        tree
        treefmt
        wget

        ### Terminal
        brotli # Generic-purpose lossless compression algorithm
        catimg # Insanely fast image printing in your terminal
        # choose # A human-friendly and fast alternative to cut and (sometimes) awk
        chroma # A general purpose syntax highlighter in pure Go
        du-dust # A more intuitive version of du in rust
        duf # Disk Usage/Free Utility - a better 'df' alternative
        hyperfine # A command-line benchmarking tool
        mmv # Move/Copy/Append/Link multiple files according to a set of wildcard patterns
        moar # Pager designed to just do the right thing without any configuration
        ncurses # A free software emulation of curses
        ov # Feature-rich terminal-based text viewer
        procs # A modern replacement for ps written in Rust
        riffdiff # Riff is a wrapper around diff that highlights which parts of lines have changed.
        # sd # Intuitive find & replace CLI (sed alternative)
        tmux # A terminal multiplexer
        xdg-ninja # A shell script which checks your $HOME for unwanted files and directories
        vivid # A themeable LS_COLORS generator with a rich filetype datebase
        # watchman # A file watching service

        ### Development
        # asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
        bore-cli # Rust tool to create TCP tunnels
        cherrybomb # A CLI tool that helps you avoid undefined user behavior by validating your API specifications
        devbox # A tool for creating isolated development environments using Nix
        # difftastic # A syntax-aware diff
        fx # Terminal JSON viewer
        # git-oxide # An idiomatic, lean, fast & safe pure Rust implementation of Git
        hugo # A fast and modern static website engine
        jql # A JSON query language tool built with Rust
        just # A handy way to save and run project-specific commands
        # lefthook # Fast and powerful Git hooks manager for any type of projects
        libxslt # A C library and tools to do XSL transformations
        ngrok # Allows you to expose a web server running on your local machine to the internet
        postgresql_14
        pre-commit # A framework for managing and maintaining multi-language pre-commit hooks
        # ruff # An Extremely fast Python linter
        shellcheck # Shell script analysis tool
        sqlite
        tokei # A program that displays statistics about your code
        yq

        ### System Monitoring
        bandwhich # Terminal bandwidth utilization tool
        btop # A monitor of resources
        # ctop # Top-like interface for container metrics
        ncdu # NCurses Disk Usage

        ### Network
        curlie # The power of curl, the ease of use of httpie
        dogdns # A command-line DNS client
        dnspeep # A network debugging tool for DNS
        httpie # A Modern command line HTTP client
        iftop # Display bandwidth usage on an interface
        # ipinfo # A command-line tool that brings you the IP address information
        mtr # A network diagnostic tool
        # nethogs # A small 'net top' tool
        nettools # A collection of useful network tools
        prettyping # A wrapper around the standard ping tool with the objective of making the output prettier, more colorful, more compact, and easier to read
        rustscan # A modern replacement for nmap
        sniffnet # Cross-platform application to monitor your network traffic with ease
        trippy # A traceroute visualizer built with Rust and WebAssembly

        ### Utilities
        clipboard-jh # Cut, copy, and paste anything, anywhere, all from the terminal
        croc # Easily and securely send things from one computer to another
        eget # Easily install prebuilt binaries from GitHub
        # gdu # Disk usage analyzer with console interface written in Go (clashes with git alias)
        ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
        glow # Render markdown on the CLI, with pizzazz!
        graphviz # Graph Visualization Software
        lnav # The Log File Navigator
        # magic-wormhole-rs # Rust implementation of Magic Wormhole, with new features and enhancements
        nali # A tool to display the location of an IP address
        neofetch # A fast, highly customizable system info script
        noti # Trigger notifications when a process completes
        ouch # A command-line utility for easily compressing and decompressing files and directories
        pandoc # Universal markup converter
        pueue # A daemon for managing long running shell commands
        ranger # A VIM-inspired filemanager for the console
        speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
        sshfs # A filesystem client based on the SSH File Transfer Protocol
        # translate-shell # Command-line translator using Google Translate, Bing Translator, Yandex.Translate, etc
        # zeal # Offline documentation browser inspired by Dash

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
        openssl
        openssh
        psmisc # A set of tools that use the proc filesystem
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
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "moar";
      # NODE_PATH = "${NODE_GLOBAL}/lib";
      # JAVA_HOME = "${pkgs.jdk11}";
      # PNPM_HOME = "${PNPM_DIR}";
    };
  };

  programs = {
    home-manager.enable = true;
    # dircolors = {
    #   enable = true;
    #   enableZshIntegration = config.programs.zsh.enable;

    #   extraConfig = __readFile (pkgs.fetchurl {
    #     url = "https://raw.githubusercontent.com/trapd00r/LS_COLORS/eeceec887830e1b30b49b08371ae0d079578a58a/LS_COLORS";
    #     hash = "sha256-Y8HrlS5thtXlRNtxefCIgWSD+vnW1bgpqf0Q88hW2s8=";
    #   });
    # };

    jq.enable = true;

    nix-index.enable = true;
    nix-index-database.comma.enable = true;

    zoxide.enable = true;
  };
}
