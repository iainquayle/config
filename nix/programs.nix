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

	freecad

    discord
    ncspot
    firefox
	nyxt
	nnn	

    xclip
    alacritty
    kitty
	tmux

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
  environment.sessionVariables = {
  };
}
