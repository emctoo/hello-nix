# nix shell

- nix-shell 加载当前目录下的 shell.nix 文件
- 如果当前目录没有 shell.nix，`nix-shell` 会寻找 default.nix。

```sh
# by `nix-shell`
nix-shell --pure --verbose

nix-shell ./shell.nix

# -p pkg1 -p pkg2
```

> 注意下面的用 `nix shell` 的是不能工作的
> `nix shell --impure --expr 'with import <nixpkgs> {}; callPackage ./shell.nix {}'`

`nix shell` 是自动一个包含了若干 installable 的shell

TODO: [`callPackage`](https://nixos-and-flakes.thiscute.world/zh/nixpkgs/callpackage)

如果是 flake, 应该选择使用 `nix develop`
