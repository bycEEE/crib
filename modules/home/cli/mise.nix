{...}: {
  programs.mise = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      experimental = true;
      verbose = false;
      auto_install = true; # Install missing tools automatically when a command needs them
      color_theme = "catppuccin";
    };

    tools = {
      node = "24";
      python = ["3.15"];
    };
  };
}
