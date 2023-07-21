{pkgs, ...}: {
  home.packages = with pkgs; [
    python39
    python39Packages.black
    python39Packages.jedi
    python39Packages.pip
    python39Packages.poetry-core
    python39Packages.pylint
    python39Packages.setuptools
  ];
}
