{pkgs, config, ...}: {
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  services = { 
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "escape";
            };
            otherlayer = {};
          };
        };
      };
    };
    gnome.gnome-keyring.enable = true;
  };
  
  programs = {
    zsh = { # not exactly essential, but nice to have and not very large. # may move back to dev
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = ''
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        GEMINI_API_KEY=$(secret-tool lookup gemini gemini);
      '';
    };
    tmux = {
      enable = true;
      extraConfig = ''
        set -s escape-time 0
      '';
    };
    git = {
      enable = true;
    };
    nano.enable = false;
  };
  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
    ZDOTDIR = "${config.users.users.iainq.home}/.config/zsh";
    GNUPGHOME = "${config.users.users.iainq.home}/.config/gpg";
    NIXOS = "1";
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k

    ripgrep
    fzf

    superfile

    unzip
    zip 
    psmisc

    zenith-nvidia
    fastfetch

    tealdeer

    libsecret
  ];
}
