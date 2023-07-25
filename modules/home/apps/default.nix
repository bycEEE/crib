{pkgs, ...}: {
  home.packages = with pkgs; [
    # czkawka # Multi functional app to find duplicates, empty folders, similar images etc
    openlens # The Kubernetes IDE
  ];
}
