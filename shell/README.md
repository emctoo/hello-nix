# nix shell

nix-shell 命令会自动寻找并加载当前目录下的 shell.nix 文件。这确实是 nix-shell 命令的默认行为。
如果当前目录没有 shell.nix，它会寻找 default.nix。

```sh
# by `nix-shell`
nix-shell --pure --verbose

# by `nix shell`
nix shell --expr 'with import <nixpkgs> {}; callPackage ./shell.nix {}'
```
