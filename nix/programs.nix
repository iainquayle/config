{pkgs, ...}:
{
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
    #libGL
    #libGLU

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
}
