{ inputs, pkgs, ... }:
let
  stable = inputs.stable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  home.packages = with pkgs; [
    # Formatters
    jsonnet # Includes jsonnetfmt
    nixfmt # Official Nix formatter (RFC 166 style)
    # nodePackages.prettier # An opinionated code formatter
    ruff # An Extremely fast Python linter and formatter and code formatter
    shfmt # A shell parser, formatter, and interpreter (POSIX/Bash/mksh)
    treefmt # Formatter multiplexer

    # Language servers
    bash-language-server # Bash
    dockerfile-language-server # Dockerfile (docker-langserver)
    gopls # Go
    helm-ls # Helm chart templates (helm_ls)
    jsonnet-language-server # Jsonnet
    just-lsp # Justfile
    lua-language-server # Lua
    # From stable: on unstable, Swift (needed by .NET on macOS) currently fails to build
    stable.marksman # Markdown
    nil # Nix
    pyright # Python
    taplo # TOML
    terraform-ls # Terraform
    typescript-language-server # Typescript
    vscode-langservers-extracted # JSON, HTML, CSS (vscode-json-language-server etc.)
    yaml-language-server # YAML / JSON
    # rnix-lsp # Nix
  ];
}
