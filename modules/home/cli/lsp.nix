{pkgs, ...}: {
  home.packages = with pkgs; [
    # Formatters
    alejandra # A formatter for nixpkgs
    nixpkgs-fmt # nix code formatter that would be applied on nixpkgs
    # nodePackages.prettier # An opinionated code formatter
    shfmt # A shell parser, formatter, and interpreter (POSIX/Bash/mksh)

    # Language servers
    gopls # Go
    nil # Nix
    nodePackages.bash-language-server # Bash
    # nodePackages.typescript-language-server # Typescript
    nodePackages.yaml-language-server # YAML / JSON
    python311Packages.python-lsp-server # Python
    # rnix-lsp # Nix
  ];
}
