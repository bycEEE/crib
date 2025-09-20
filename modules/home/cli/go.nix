{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    go-tools
  ];
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/go";
      GOBIN = "${config.home.homeDirectory}/go/bin";
    };
  };
}
