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
      viAlias = true;
      vimAlias = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    cmake
    gnumake
    git
    gh

    freecad
    libreoffice-still

    discord
    ncspot
    firefox
    nyxt
    nnn    
    vlc

    xclip
    alacritty
	nushell
    tmux
    fzf

    unzip
    psmisc

    zenith-nvidia
    fastfetch

	wlr-randr

    python3
    #pyright

    cargo
    #rust-analyzer

    go
    #gopls

    gcc
    #clangd

    elixir
    #elixir-ls

    erlang

    nodejs
    #typescript

    tectonic
    #texlab

    #nil
    #lua-language-server

    #current hack for linking mason lsps, use fhs, cuda works since it has glib and whatnot
    #options in the future:
    #    auto start a fhs in each open shell
    #    or us nix-ld, catches dynamic linking
    #    set an environment variable, and have nvim switch between on machine lsps (nix) and mason lsps (other os)
  ];
  environment.sessionVariables = {
    
  };
}
