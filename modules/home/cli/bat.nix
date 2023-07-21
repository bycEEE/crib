{...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "never";
      style = "plain";
      # color = "always";
      theme = "base16";
    };
  };
}
