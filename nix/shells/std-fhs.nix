{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "cuda-env";
  targetPkgs = pkgs: with pkgs; [
    stdenv.cc 
    glibc
    binutils 
    libGL 
    libGLU 
    #zlib
    #gnumake 
    #m4 
    util-linux
  ];
  #multiPkgs = pkgs: with pkgs; [zlib];
  runScript = "zsh";
  profile = ''
    export EXTRA_CCFLAGS="-I/usr/include"
  '';
}).env
