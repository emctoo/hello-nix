let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/038fb464fcfa79b4f08131b07f2d8c9a6bcc4160.tar.gz") {};
in
  pkgs.stdenv.mkDerivation {
    src = ./rust-hello;
    name = "rust-hello-0.1";
    system = "x86_64-linux";
    nativeBuildInputs = [ pkgs.cargo ];
    buildPhase = ''
      cargo clean
      cargo build --release
    '';
    installPhase = ''
      echo $out
      mkdir -p $out/bin
      cp target/release/rust-hello $out/bin/rust-hello
      # chmod +x $out/bin/rust-hello
    '';
  }
