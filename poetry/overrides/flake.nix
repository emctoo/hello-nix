{
  description = "一个演示如何重写 Python 包的 Nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              python3 = prev.python311.override {
                packageOverrides = python-final: python-prev: {
                  requests = python-prev.requests.overridePythonAttrs (oldAttrs: {
                    version = "2.25.0";
                    src = python-final.fetchPypi {
                      pname = "requests";
                      version = "2.25.0";
                      sha256 = "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8";
                    };
                  });
                };
              };
            })
          ];
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            (pkgs.python3.withPackages (ps: [ ps.requests ]))
          ];
        };
      }
    );
}
