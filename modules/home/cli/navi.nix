{...}: {
  programs.navi = {
    enable = true;
    enableZshIntegration = false; # We override the default FZF command in modified script
    settings = {
      style = {
        tag = {
          color = "cyan"; # text color. possible values: https://bit.ly/3gloNNI
          width_percentage = 30; # column width relative to the terminal window
          min_width = 30; # minimum column width as number of characters
        };
        comment = {
          color = "yellow";
          width_percentage = 40;
          min_width = 60;
        };
        snippet = {
          color = "dark_magenta";
        };
      };

      cheats = {
        paths = [
          "~/goofy/"
        ];
      };

      finder = {
        overrides = "--layout=reverse-list --no-select-1";
      };

      shell = {
        command = "bash";
        finder_command = "bash";
      };
    };
  };
}
