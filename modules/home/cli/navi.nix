{...}: {
  programs.navi = {
    enable = true;
    settings = {
      cheats = {
        paths = [
          "~/goofy/"
        ];
      };
      shell = {
        command = "zsh";
        finder_command = "zsh";
      };
    };
  };
}
