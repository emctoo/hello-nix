{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    # this won't work
    # packages.${system}.default = ...;
    # packages.${system}.debug = ...;
    packages.${system} = {
      default = pkgs.stdenv.mkDerivation {
        src = ../rust-hello;  # parent dir
        name = "rust-hello-1.0";
        nativeBuildInputs = [pkgs.cargo];
        buildPhase = ''
          cargo build --release
        '';
        installPhase = ''
          mkdir -p $out/bin
          cp target/release/rust-hello $out/bin/rust-hello
          chmod +x $out
        '';
      };
      debug = pkgs.stdenv.mkDerivation {
        name = "rust-hello-debug-1.0";
        nativeBuildInputs = [pkgs.cargo];
        buildPhase = ''
          cargo build
        '';
        installPhase = ''
          mkdir -p $out/bin
          cp target/debug/rust-hello $out/bin/rust-hello
          chmod +x $out
        '';
      };
    };
  };
}
