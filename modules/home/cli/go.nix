{pkgs, ...}: {
  home.packages = [
    pkgs.go-tools
  ];
  programs.go = {
    enable = true;
    goPath = "go";
    goBin = "go/bin";
  };
}
