{ pkgs ? import <nixpkgs> {} }:

let
  pythonEnv = pkgs.python311.withPackages (ps: with ps; [
    pip
    numpy
    pandas
    matplotlib
    requests
  ]);
in pkgs.mkShell {
  packages = with pkgs; [
    pythonEnv
    which
  ];

  env = {
    PYTHONPATH = "${pythonEnv}/${pkgs.python3.sitePackages}";
    MY_CUSTOM_VAR = "Hello from Nix";
  };

  shellHook = ''
    echo "进入 Python $(python --version) 环境"
    echo "Python 解释器路径: $(type -p python)"
    echo "自定义环境变量: $MY_CUSTOM_VAR"
    echo "可用的 Python 包:"
    pip list
  '';
}
