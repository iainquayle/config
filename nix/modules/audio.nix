{pkgs, ...}: {
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = { # replaces pulseaudio
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true; # manager for pipewire
  };
  environment.systemPackages = with pkgs; [
    playerctl # media player control
  ];
}
