{...}: {
  programs.navi = {
    enable = true;
    enableZshIntegration = false; # We override the default FZF command in modified script
    settings = {
      cheats = {
        paths = [
          "~/goofy/"
        ];
      };
      finder = {
        overrides = "--layout=reverse-list";
      };
      shell = {
        command = "zsh";
        finder_command = "zsh";
      };
    };
  };
}
