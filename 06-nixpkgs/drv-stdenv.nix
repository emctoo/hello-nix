let
  let pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/0b20bf89e0035b6d62ad58f9db8fdbc99c2b01e8.tar.gz") {};
in
  pkgs.stdenv.stdenv.mkDerivation {
    system = "x86_64-linux";
    name = "hello-1.0";
    dontUnpack = true;
    src = ./hello.sh;
    installPhase = ''
      cp $src $out
      chmod +x $out
    '';
  }
