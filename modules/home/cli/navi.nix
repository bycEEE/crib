{...}: {
  programs.navi = {
    enable = true;
    settings = {
      cheats = {
        paths = [
          "~/goofy/"
        ];
      };
      finder = {
        overrides = "--layout=reverse-list --no-select-1";
      };
      shell = {
        command = "zsh";
        finder_command = "zsh";
      };
    };
  };
}
