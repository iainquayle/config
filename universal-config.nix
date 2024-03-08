{ config, pkgs, ... }:

{
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
	powerline-symbols
	(nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" ];})
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xclip
    alacritty

    python3
	rustup
	go
	gcc
    nodejs
    cmake
    gnumake
    git
    gh

    steam
    discord
    firefox
    ncspot

    zsh-powerlevel10k
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.picom.enable = true;
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
      ];
    };
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
	noDesktop = true;
	enableXfwm = false;
      };
    };
    displayManager = {
      lightdm.enable = true;
      defaultSession = "xfce+i3";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
