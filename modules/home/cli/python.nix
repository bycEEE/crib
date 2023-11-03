{pkgs, ...}: {
  home.packages = with pkgs; [
    python311
    # python311Packages.black
    # python311Packages.jedi
    # python311Packages.pip
    python311Packages.poetry-core
    python311Packages.pylint
    python311Packages.setuptools
    python311Packages.virtualenv
  ];
}
