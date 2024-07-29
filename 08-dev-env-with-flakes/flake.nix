{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

  outputs = {self, nixpkgs}: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pythonVersions = {
        python311 = pkgs.python311;
        python312 = pkgs.python312;
        default = pkgs.python312;
      };
      mkPythonShell = shellName: pythonPackage: pkgs.mkShell {
        packages = [ pythonPackage ];
        shellHook = ''
          echo "Enterning ${shellName} ..."
        '';
      };
    in {
      # devShells.${system}.default = pkgs.mkShell {
      #   packages = [
      #     pkgs.cargo
      #     pkgs.python3
      #   ];
      #   RUST_LOG = "debug";
      # };

      devShell.${system} = builtins.mapAttrs mkPythonShell pythonVersions;
    };
}
