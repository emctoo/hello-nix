{ pkgs ? import <nixpkgs> {} }:

let
  pythonEnv = pkgs.python311.withPackages (ps: with ps; [
    pip
    numpy
    pandas
    matplotlib
    requests
  ]);
in
pkgs.mkShell {
  buildInputs = [
    pythonEnv
  ];

  shellHook = ''
    export PATH=${pythonEnv}/bin:$PATH
    export PYTHONPATH=${pythonEnv}/${pkgs.python3.sitePackages}:$PYTHONPATH

    echo "进入 Python $(${pythonEnv}/bin/python --version) 环境"
    echo "Python 解释器路径: $(type python)"
    echo "可用的 Python 包:"
    ${pythonEnv}/bin/pip list
  '';
}
