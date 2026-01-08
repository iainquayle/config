{lib, pkgs, ...}: {
  programs = {
    chromium.enable = false;
    kdeconnect.enable = true;
    firefox.enable = true;
    dconf = {
      enable = true;
      profiles.user.databases = [{
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            gtk-theme = "rose-pine-moon-gtk";
            icon-theme = "rose-pine-moon-icon";
            #cursor-theme = 
          };
        };
      }];
    };
  };

  environment.etc."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=rose-pine-moon-gtk
    gtk-icon-theme-name=rose-pine-moon-icons
    gtk-application-prefer-dark-theme=1
  '';

  environment.sessionVariables = {
    GTK_THEME = "rose-pine-moon-gtk";
  };

  environment.systemPackages = with pkgs; [
    #vieb
    qutebrowser

    alacritty
    kitty

    freecad
    #renderdoc

    ncspot # this should be elsewhere?

    mpv # media player
    imv # image viewer

    pwvucontrol # pipewire gui
    iwgtk # iwd gui

    pcmanfm # file manager

    rose-pine-gtk-theme
    rose-pine-icon-theme

    #gruvbox-gtk-theme
    #gruvbox-plus-icons
  ];

  services = {
    gvfs = {
      enable = true; # gnome virtual file system, for connections to network files
      package = lib.mkForce pkgs.gnome.gvfs;
    };
    blueman.enable = true; # bluetooth gui
  };

  fonts = {
    packages = with pkgs; [
      #font-awesome
      #meslo-lgs-nf
      #fira-code
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];
    fontDir.enable = true;
  };
}
