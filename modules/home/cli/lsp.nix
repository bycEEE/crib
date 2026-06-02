{pkgs, ...}: {
  home.packages = with pkgs; [
    # Formatters
    alejandra # A formatter for nixpkgs
    just-formatter # Justfile formatter
    nixpkgs-fmt # nix code formatter that would be applied on nixpkgs
    # nodePackages.prettier # An opinionated code formatter
    shfmt # A shell parser, formatter, and interpreter (POSIX/Bash/mksh)

    # Language servers
    bash-language-server # Bash
    gopls # Go
    just-lsp # Justfile
    nil # Nix
    lua-language-server # Lua
    pyright # Python
    terraform-ls # Terraform
    typescript-language-server # Typescript
    yaml-language-server # YAML / JSON
    # rnix-lsp # Nix
  ];
}
