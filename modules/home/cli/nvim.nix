{...}: {
  programs.neovim = {
    enable = true;
  };
  home.file.".config/nvim/" = {
    source = builtins.fetchGit {
      url = "https://github.com/NvChad/NvChad.git";
      rev = "9d37797e6f9856ef25cfa266cff43f764e828827";
    };
  };
}
