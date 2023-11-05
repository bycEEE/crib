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
      shell = {
        command = "zsh";
        finder_command = "zsh";
      };
    };
  };
}
