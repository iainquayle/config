{pkgs, config, ...}: {
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # pabkages that may make sense to get or switch to
  # zellij vs tmux
  # 7zip
  # entr # run a command when a file changes, probably put in dev
  # tldr # better docs
  # rclone or rsync # file sync
  
  programs = {
    zsh = { # not exactly essential, but nice to have and not very large.
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = ''
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
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
  };
  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
    ZDOTDIR = "${config.users.users.iainq.home}/.config/zsh";
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k

    ripgrep
    fzf

    superfile

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
}
