{pkgs, ...}: {
  home.packages = [
  ];

  programs.awscli = {
    enable = true;
  };
}
