{pkgs, ...}: {
  home.packages = with pkgs; [
    go-tools
  ];
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
  };
}
