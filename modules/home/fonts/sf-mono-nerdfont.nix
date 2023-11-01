{pkgs}:
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "sf-mono-nerdfont";
  version = "dc5a3e6fcc2e16ad476b7be3c3c17c2273b260ea";
  src = builtins.fetchGit {
    url = "https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized";
    rev = "${version}";
  };

  dontConfigure = true;
  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp -R $src/*.otf $out/share/fonts/opentype/
  '';
}
