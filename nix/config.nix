{ config, pkgs, ... }:
{
  users.users.iainq = {
    isNormalUser = true;
    description = "Iain Quayle";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
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
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
	  enable = true;
	};
  };

  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #xdg.portal.enable = true;
  #services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    python3
	rustup
	go
	gcc
	#gcc-unwrapped
    nodejs
    cmake
    gnumake
    git
    gh

    discord
    firefox
    ncspot

    xclip
    alacritty
	dmenu
	tectonic
	unzip
	pavucontrol
	#wicd
  ];

  networking.hostName = "idfk"; 
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

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
	powerline-symbols
	(nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" ];})
  ];

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
