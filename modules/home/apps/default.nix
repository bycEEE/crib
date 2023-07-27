{pkgs, ...}: {
  home.packages = with pkgs;
    [
      # czkawka # Multi functional app to find duplicates, empty folders, similar images etc
    ]
    ++ (lib.lists.optionals (pkgs.system == "x86_64-linux") [
      # https://github.com/NixOS/nixpkgs/issues/222991
      openlens # The Kubernetes IDE
    ]);
}
