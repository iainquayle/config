{pkgs, config, ...}: {
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  programs.tmux = {
    enable = true;
	extraConfig = ''
	  set -s escape-time 0
	'';
  };

  environment.sessionVariables = {
    ZDOTDIR = "${config.users.users.iainq.home}/.config/zsh";
  };

  environment.systemPackages = with pkgs; [
    git

    nnn    
    superfile

    unzip
    psmisc

    zenith-nvidia
    fastfetch
  ];
}
