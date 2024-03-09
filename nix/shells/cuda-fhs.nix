{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "cuda-env";
  targetPkgs = pkgs: with pkgs; [
    cudatoolkit
	linuxPackages.nvidia_x11
	stdenv.cc binutils 
	libGL libGLU zlib
	gnumake m4 util-linux

	#python311Packages.torch
	#python311Packages.pandas
  ];
  multiPkgs = pkgs: with pkgs; [zlib];
  runScript = "zsh";
  profile = ''
	export CUDA_PATH=${pkgs.cudatoolkit}
	export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib" 
	export EXTRA_CCFLAGS="-I/usr/include"
  '';
}).env
