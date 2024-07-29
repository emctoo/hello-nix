{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

  outputs = {self, nixpkgs}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system} = {
        default = pkgs.writeApplicationShell {
          name = "my-app";
          buildInputs = [ pkgs.bash pkgs.coreutils pkgs.gawk ];
          shellHook = ''
            echo "Hello, world!"
          '';
        };
      };

      apps.${system}.default = packages.${system}.default;
    }
}
