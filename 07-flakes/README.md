# Flakes

Original post [7 what about flakes then?](https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/nix-7-what-about-flakes-then/)

## what is a flake?

## an example flake

./flake.nix

`nix build <installable>`

installable: <https://nix.dev/manual/nix/2.22/command-ref/new-cli/nix#installables>

这个地方主要是 flake output attribute
可以加 parameters: dir, ref, rev
可以是特定的 commit
