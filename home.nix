{ config, pkgs, nix-colors, ... }:
{
  imports = [
    ./home/sway
    ./home/hyprland
    ./home/waybar
    ./home/theme
    ./home/nushell
    ./home/helix
    ./home/zsh
    ./home/firefox
    ./home/rofi
    ./home/ranger
    ./home/discord
    ./home/foot
    ./home/git
    ./home/agzen
    ./home/direnv
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ansel";
  home.homeDirectory = "/home/ansel";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # nixpkgs.overlays = [  (final: prev: {freecad = prev.freecad.overrideAttrs (old: {
  #     src = pkgs.fetchFromGitHub {
  #       owner = "FreeCad";
  #       repo = "FreeCad";
  #       rev = "59c1ccec3e6b70f56eeee8f94d361019b84bd850";
  #       hash = "sha256-SsC73QPBIRkqH/ZI43oPHhug6/hiypgdP0t8n2aaiiQ=";
  #     };
      
  #   });})
  # ];
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Command line apps
#    (pkgs.alvr.overrideAttrs (old: {
 #     pname = "alvr";
  #version = "20.14.0";
#
 # src = fetchFromGitHub {
  #  owner = "alvr-org";
   # repo = "ALVR";
    #tag = "v20.14.0";
   # fetchSubmodules = true; # TODO devendor openvr
   # hash = "sha256-K1E8zeSjaUtJ17C9G+aKNw9bzKUzeezUunZc0MM1Rj4=";
 # };
  
 # useFetchCargoVendor = true;
  #cargoHash = "";
   # }))
    git
    lazygit
    sshfs
    htop-vim
    neofetch
    killall
    sl
    lolcat
    eza
    tree
    man-pages
    man-pages-posix
    zip
    unzip
    gpclient
    gcc
    curl
    bc
    avrdude
    platformio
    cowsay
    figlet
    usbutils
    gdu
    imagemagick
    pcsclite
    fzf
    legcord
    typst
    bitwarden-desktop
    bitwarden-cli
    comma
    firefox
    flameshot
    flatpak
    discord
    r2modman
    ckan
    jetbrains.idea-community-src
    libgbm
    spicetify-cli
    swww
    greetd.greetd
    greetd.tuigreet
    bs-manager
    android-tools
    godot
    jetbrains-toolbox
    peazip
    gh
    cargo
    android-tools
    qmk
    vial

    # Desktop
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    feh
    gimp
    freecad
    prusa-slicer
    hyprpaper

    # bambu-studio
    obsidian
    vscode
    octaveFull
    libreoffice-still
    gparted
    peek
    vlc
    inkscape
    logisim
    kicad
    qgis
    pulseview
    zoom-us
    loupe
    wayvnc
    zotero
    nmap
    iperf
    chirp
    cheese
    zathura
    
    # Services
    xdg-utils

    # Configuration
    networkmanagerapplet
    pavucontrol
    lxappearance
    mesa-demos
    inxi
    acpi
    pciutils

    # Games
    jdk8
    prismlauncher
    alsa-oss

    # Windowsnn
    wine
    protontricks
    winetricks
    bottles
    samba
    ppp
    cabextract
    stm32cubemx
    libnotify

    # Font
    nasin-nanpa
    texliveSmall
    texlab
    remmina
    # rustdesk
    libqalculate
    kdePackages.kdeconnect-kde
    scrcpy
    chromium
    (writeShellScriptBin "current" ''
    echo "$(cat /sys/class/power_supply/BAT1/current_now)uA * $(cat /sys/class/power_supply/BAT1/voltage_now)uV" | qc
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuraDtion will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Random Configs
  xdg.desktopEntries = {
    helix = {
      name = "Hx";
      icon = "helix";
      genericName = "Text Editor";
      exec = "foot -e hx";
      terminal = false;
      type = "Application";
    };

    ltspice = {
      name = "ltspice";
      genericName = "Circuit Simulator";
      exec = "wine \"/home/silas/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx86.exe\"";
      terminal = false;
      type = "Application";
    };
    chirp = {
      name = "chirp";
      genericName = "Radio Programmer";
      exec = "chirp";
      terminal = false;
      type = "Application";
    };
  };


  programs.git = {
    enable = true;
    userName = "soanglengan";
    userEmail = "nongag.lesna@gmail.com";
    extraConfig = {
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };


  services.ssh-agent = {
    enable = true;
  };

  programs.ssh = {
    enable = true; 
   };
  programs.spicetify = {
    enable = true;
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/silas/etc/profile.d/hm-session-vars.sh
  #

  home.shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color -i";
      mkdir = "mkdir -p";
      update = "sudo nixos-rebuild switch --flake /home/ansel/.config/nix";
      la = "ls -a";
      rr = "rm -r";
      hm = "home-manager --flake ~/.config/nix";
      ec = "sudoedit /etc/nixos/configuration.nix";
      eh = "hx ~/.config/nix/";
      neofetch = "neofetch | lolcat";
      shell = "nix-shell -p";
  };

  home.sessionVariables = {
    PS1 = " %F{blue}%~%f %F{green}>%f ";
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
