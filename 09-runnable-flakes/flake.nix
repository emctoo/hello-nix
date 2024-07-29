{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

  outputs = {self, nixpkgs}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in rec {
      packages.${system} = {
        default = pkgs.writeShellApplication {
          name = "my-greeting";
          text = ''
            echo "Hello, world!"
          '';
        };
      };

      apps.${system}.default = let
        hello = packages.${system}.default;
      in {
        type = "app";
        program = "${hello}/bin/my-greeting";
      };
      # apps.${system}.default = pkgs.writeShellApplication {
      #   name = "my-greeting";
      #   text = ''
      #     echo "Hello, world!"
      #   '';
      # };
    };
}
