{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "never";
      style = "plain";
      # color = "always";
      theme = "base16";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
      prettybat
    ];
  };
}
