{ inputs, pkgs, ... }:
{

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "ansel" ];
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      cairo
      cups
      curl
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      glibmm
      gtk3
      icu
      libao
      libGL
      libappindicator-gtk3
      libdrm
      libglvnd
      libjpeg
      libnotify
      libpng
      libpulseaudio
      libtiff
      libunwind
      libusb1
      libuuid
      libxkbcommon
      mesa
      nspr
      nss
      openal
      openssl
      pango
      pipewire
      SDL2
      stdenv.cc.cc
      systemd
      vulkan-loader
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxcb
      xorg.libxkbfile
      xorg.libxshmfence
      xorg.libXinerama
      xorg.libXv
      zlib
    ];
  };

}
