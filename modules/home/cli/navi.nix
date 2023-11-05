{...}: {
  programs.navi = {
    enable = true;
    enableZshIntegration = false;
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
