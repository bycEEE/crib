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
    ./bat.nix
    ./direnv.nix
    ./exa.nix
    ./fzf.nix
    ./git.nix
    ./htop.nix
    ./go.nix
    # ./gpg.nix
    ./python.nix
    ./ssh.nix
    # ./neovim.nix
    ./shell.nix
    ./starship.nix
    ./tealdeer.nix
    ./vim.nix
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

        ### Nix tools
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
        nvfetcher # Generate nix sources expr for the latest version of packages
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
        navi # An interactive cheatsheet tool for the command-line and application launchers
        ncurses # A free software emulation of curses
        ov # Feature-rich terminal-based text viewer
        procs # A modern replacement for ps written in Rust
        # pueue # A daemon for managing long running shell commands
        riffdiff # Riff is a wrapper around diff that highlights which parts of lines have changed.
        # sd # Intuitive find & replace CLI (sed alternative)
        tmux # A terminal multiplexer
        xdg-ninja # A shell script which checks your $HOME for unwanted files and directories
        vivid # A themeable LS_COLORS generator with a rich filetype datebase
        # watchman # A file watching service
        zellij # A terminal workspace with batteries included

        ### Development
        # asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
        bore-cli # Rust tool to create TCP tunnels
        cherrybomb # A CLI tool that helps you avoid undefined user behavior by validating your API specifications
        devbox # A tool for creating isolated development environments using Nix
        # difftastic # A syntax-aware diff
        # git-oxide # An idiomatic, lean, fast & safe pure Rust implementation of Git
        jql # A JSON query language tool built with Rust
        just # A handy way to save and run project-specific commands
        # lefthook # Fast and powerful Git hooks manager for any type of projects
        ngrok # Allows you to expose a web server running on your local machine to the internet
        postgresql_14
        pre-commit # A framework for managing and maintaining multi-language pre-commit hooks
        # ruff # An Extremely fast Python linter
        shellcheck # Shell script analysis tool
        sqlite
        tokei # A program that displays statistics about your code
        yq

        ### DevOps
        act # Run your GitHub Actions locally
        ansible # Radically simple IT automation platform
        chart-testing # CLI tool for linting and testing Helm charts
        # colima # Container runtimes on macOS (and Linux) with minimal setup
        # dive # A tool for exploring each layer in a docker image
        docker
        docker-compose
        # hadolint # A smarter Dockerfile linter that helps you build best practice Docker images
        helm-docs # Generate documentation from Kubernetes Helm charts
        helmfile
        # infracost # Cloud cost estimates for Terraform in pull requests
        k9s # Kubernetes CLI To Manage Your Clusters In Style!
        kind # Kubernetes IN Docker - local clusters for testing Kubernetes
        # kompose # Tool to move from docker-compose to Kubernetes
        kubectl
        kubectx # Switch faster between clusters and namespaces in kubectl
        kubent # Easily check your clusters for use of deprecated APIs
        (wrapHelm kubernetes-helm {
          plugins = with kubernetes-helmPlugins; [
            helm-diff
            helm-secrets
          ];
        })
        kustomize
        # levant # An open source templating and deployment tool for HashiCorp Nomad jobs
        # nomad
        # podman # A program for managing pods, containers and container images
        # skaffold # Easy and Repeatable Kubernetes Development
        # skopeo # Inspect container images and repositories on registries
        stern # Multi pod and container log tailing for Kubernetes
        # tanka # Flexible, reusable and concise configuration for Kubernetes
        # terraform
        # terraform-docs # A utility to generate documentation from Terraform modules in various output formats
        # terraformer # CLI tool to generate terraform files from existing infrastructure (reverse Terraform)
        tflint # A Terraform linter focused on possible errors, best practices, etc
        vault

        ### Cloud
        aws-assume-role # Assume AWS IAM roles from the command-line
        aws-iam-authenticator # A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
        awscli2
        eksctl
        # google-cloud-sdk
        saml2aws # CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP

        ### System Monitoring
        bandwhich # Terminal bandwidth utilization tool
        bottom # A cross-platform graphical process/system monitor with a customizable interface and a multitude of features
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
        graphviz # Graph Visualization Software
        lnav # The Log File Navigator
        # magic-wormhole-rs # Rust implementation of Magic Wormhole, with new features and enhancements
        nali # A tool to display the location of an IP address
        neofetch # A fast, highly customizable system info script
        noti # Trigger notifications when a process completes
        ouch # A command-line utility for easily compressing and decompressing files and directories
        pandoc # Universal markup converter
        speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
        # ranger # A VIM-inspired filemanager for the console
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
