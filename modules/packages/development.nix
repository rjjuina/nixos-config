{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        pip
        setuptools
        wheel
        virtualenv
      ]
    ))

    nodejs_24

    gcc
    stdenv.cc.cc.lib
    zlib

    fd
    tree
    jq
  ];

  environment.variables = {
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib";
  };
}
