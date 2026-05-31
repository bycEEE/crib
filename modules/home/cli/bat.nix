{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "never";
      style = "plain";
      # color = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
      prettybat
    ];
  };
  catppuccin.bat.enable = true;
}
