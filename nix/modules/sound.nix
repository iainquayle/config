{pkgs, ...}: {
  sound.enable = false; #meant for ALSA only, using pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  #disable wireplumber if using pamixer?
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
    playerctl
  ];
}
