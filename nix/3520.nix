{ ... }: {
  imports = [
    ./modules/audio.nix
    ./modules/base.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/gaming.nix
    ./modules/wayland-wms.nix
    ./modules/laptop.nix
    ./modules/network.nix
    ./modules/qmk.nix
  ];

  networking.hostName = "dell";
}
