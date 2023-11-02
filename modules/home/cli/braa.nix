{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  zlib,
  subversion,
  nasm,
}:
stdenv.mkDerivation rec {
  pname = "braa";
  version = "0.82";

  src = fetchurl {
    url = "http://s-tech.elsat.net.pl/${pname}/${pname}-${version}.tar.gz";
    sha256 = "d650d34cdf30fcbbbbf4e4f11c8f5d51fd5caa3cca58d620fa1d978b8c18919c";
  };

  buildInputs = [zlib subversion nasm];

  installPhase = ''
    install -Dm755 braa $out/bin/braa
  '';

  meta = with lib; {
    description = "A mass snmp scanner.";
    homepage = "http://s-tech.elsat.net.pl";
    license = licenses.gpl2;
    platforms = platforms.unix;
    maintainers = with maintainers; [bycEEE];
  };
}
