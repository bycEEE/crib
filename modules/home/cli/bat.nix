{pkgs, ...}: {
  # From https://github.com/hmajid2301/dotfiles/blob/main/home-manager/programs/starship.nix
  xdg.configFile."bat/themes/Catppuccin-macchiato.tmTheme".text = builtins.readFile (pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/bat/477622171ec0529505b0ca3cada68fc9433648c6/Catppuccin-macchiato.tmTheme";
    hash = "sha256-76fS4lq8obgOAYaKSVqBc2wOP+RLUCeTQL69vrUfs3k=";
  });
  xdg.configFile."bat/themes/Catppuccin-macchiato.tmTheme".onChange = "${pkgs.bat}/bin/bat cache --build";

  programs.bat = {
    enable = true;
    config = {
      pager = "never";
      style = "plain";
      # color = "always";
      theme = "Catppuccin-macchiato";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
      prettybat
    ];
  };
}
