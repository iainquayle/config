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
	  gamescopeSession.enable = true;
	};
  };

  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #xdg.portal.enable = true;
  #services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    python3
	cargo
	go
	gcc
	#gcc-unwrapped
    nodejs
    cmake
    gnumake
    git
    gh
	libGL
	libGLU

    discord
    firefox
    ncspot

    xclip
    alacritty
	tectonic
	unzip
	pavucontrol
	pamixer
  ];
  environment.shellAliases = {
    cuda-env = "nix-shell ~/.config/nix/shells/cuda-fhs.nix";
	py-test = "python -m unittest -v";
  };

  networking.hostName = "idfk"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.picom = {
    enable = true;
	shadow = true;
	fade = true;
	fadeDelta = 5;
	settings = {
	  blur = {
	    #method = "kernel";
		#kern = "7,7,7";
		#backend = "xrender";
		method = "dual_kawase";
		strength = 5;
		backend = "glx";
	  };
	  corner-radius = 15;
	};
  };
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
	xkbOptions = "caps:escape";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
		dmenu
      ];
	  package = pkgs.i3-gaps;
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
