{ ... }: {
  programs.mise = {
    enable = true;
    enableZshIntegration = true;

    globalConfig = {
      settings = {
        experimental = true;
        verbose = false;
        auto_install = true; # Install missing tools automatically when a command needs them
        color_theme = "catppuccin";

        python.uv_venv_auto = "create|source"; # In uv projects (nearest uv.lock), create .venv if missing and activate it
      };

      # tools = {
      #   node = "24";
      # };
    };
  };
}
