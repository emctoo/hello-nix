let
   pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/038fb464fcfa79b4f08131b07f2d8c9a6bcc4160.tar.gz") {};
in pkgs.writeShellApplication {
  name = "hello";

  text = ''
    echo Hello World
  '';
}
