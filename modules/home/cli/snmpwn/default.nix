{
  stdenv,
  lib,
  bundlerEnv,
}: let
  rubyEnv = bundlerEnv {
    name = "snmpwn-ruby-env";
    gemdir = ./.;
  };
in
  stdenv.mkDerivation rec {
    pname = "snmpwn";
    version = "v0.97b";
    src = builtins.fetchGit {
      url = "https://github.com/hatlord/snmpwn";
      rev = "0dee1d02e1d24159664ad56533a081f0039a68bf";
    };

    buildInputs = [rubyEnv.wrappedRuby];

    installPhase = ''
      mkdir -p $out/bin
      cp *.rb $out/bin
      mv $out/bin/snmpwn.rb $out/bin/snmpwn
    '';

    meta = with lib; {
      description = "SNMPv3 user enumerator and attack tool";
      homepage = "https://github.com/hatlord/snmpwn";
      license = licenses.mit;
      maintainers = with maintainers; [bycEEE];
      platforms = platforms.unix;
    };
  }
