{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSEnv {
  name = "cuda-env";
  targetPkgs = pkgs: with pkgs; [
    stdenv.cc.cc.lib
    glibc
    binutils 
    libGL 
    libGLU 
    zlib

    # Common dependencies for Python document/image processing
    libz
    glib
    libxcb
    libx11
    libxext
    libxrender
    libice
    libsm

    #gnumake 
    #m4 
    util-linux
  ];
  multiPkgs = pkgs: with pkgs; [zlib];
  runScript = "zsh";
  profile = ''
    export EXTRA_CCFLAGS="-I/usr/include"
  '';
}).env
