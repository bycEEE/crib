{...}: {
  programs.vim = {
    enable = true;
    settings = {
      expandtab = true; # expand tabs to spaces
      mouse = "v"; # disable mouse in visual mode
    };
  };
}
