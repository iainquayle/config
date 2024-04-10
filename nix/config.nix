{ config, pkgs, ... }:
{
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.defaultUserShell = pkgs.zsh;

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        #theme = "jonathan";
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    thunar.enable = true;
  };

  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #xdg.portal.enable = true;
  #services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    python3
    cargo
    go
    gcc
    nodejs
    cmake
    gnumake
    git
    gh
    tectonic
    #think these two can be removed since cuda env is used
    libGL
    libGLU

    discord
    firefox
    ncspot

    xclip
    alacritty
    unzip
    psmisc
	zenith-nvidia
	neofetch

    pavucontrol
    pamixer
    playerctl

    lxappearance
    feh
	brightnessctl
  ];
  environment.shellAliases = {
    cuda-env = "nix-shell ~/.config/nix/shells/cuda-fhs.nix";
    py-test = "python -m unittest -v";
    #picom-toggle = "killall picom || picom";
  };

  networking.hostName = "idfk"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";

  i18n.defaultLocale = "en_CA.UTF-8";

  services = {
    picom = {
      enable = true;
      shadow = true;
      fade = true;
      fadeDelta = 8;
      settings = {
        blur = {
          #method = "kernel";
          #kern = "7,7,7";
          #backend = "xrender";
          #method = "dual_kawase";
          #strength = 5;
          #backend = "glx";
        };
        corner-radius = 0;
      };
    };
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      xkbOptions = "caps:escape";
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          rofi
          i3status
          i3lock
        ];
        package = pkgs.i3-gaps;
      };
      desktopManager = {
        xterm.enable = false;
        xfce.enable = false;
      };
      displayManager = {
        defaultSession = "none+i3";
      };
    };
    printing.enable = true;
  };


  sound.enable = false; #menat for ALSA only, using pipewire
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 30;

      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" ];})
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
