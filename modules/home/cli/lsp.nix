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
    bash-language-server # Bash
    # typescript-language-server # Typescript
    yaml-language-server # YAML / JSON
    python313Packages.python-lsp-server # Python
    # rnix-lsp # Nix
  ];
}
