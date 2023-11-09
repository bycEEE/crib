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
        command = "bash";
        finder_command = "bash";
      };
    };
  };
}
