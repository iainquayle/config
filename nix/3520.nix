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
    ./modules/netbird.nix
    ./modules/network.nix
    ./modules/qmk.nix
    ./modules/trading.nix
  ];

  networking.hostName = "dell";
}
