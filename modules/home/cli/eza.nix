{...}: {
  programs.eza = {
    enable = true;
    # ls = "exa";
    # ll = "exa -l";
    # la = "exa -a";
    # lt = "exa --tree";
    # lla = "exa -la";
    enableAliases = false;
  };
}
