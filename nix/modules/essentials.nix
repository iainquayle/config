{pkgs, config, ...}: {
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      promptInit = ''
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      '';
      ohMyZsh = {
        enable = false;
        #enable = true;
        #theme = "agnoster";
        #theme = "jonathan";
        #theme = "fino-time";
        #theme = "xiong-chiamiov-plus";
      };
    };
    tmux = {
      enable = true;
      extraConfig = ''
        set -s escape-time 0
      '';
    };
  };
  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
    ZDOTDIR = "${config.users.users.iainq.home}/.config/zsh";
  };

  environment.systemPackages = with pkgs; [
    git

    zsh-powerlevel10k

    superfile

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
}
