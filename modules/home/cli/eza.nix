{...}: {
  programs.eza = {
    enable = true;
    icons = "auto";
    extraOptions = [
      "--color=always"
      "--group-directories-first"
      "--header"
      "--time-style=long-iso"
    ];
  };
  catppuccin.eza.enable = true;
}
