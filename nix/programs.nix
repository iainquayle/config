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
	elixir
	erlang
    nodejs
    tectonic

    cmake
    gnumake

    git
    gh

    discord
    firefox
    ncspot

    xclip
    alacritty
    kitty
	tmux

    unzip
    psmisc

    zenith-nvidia
    neofetch
  ];
  environment.sessionVariables = {
  };
}
