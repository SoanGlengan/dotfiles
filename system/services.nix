{ pkgs, lib, ... }:
{

  services = {
    automatic-timezoned.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = false;
      };
    };

    dbus.enable = true;

    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gnome.gvfs;
    };

    udisks2.enable = true;

    samba.enable = true;
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    udev.packages = with pkgs; [
      platformio-core.udev
    ];

    blueman.enable = true;
    pcscd.enable = true;
    tumbler.enable = true; # thumbnail something
  };

  hardware = {
    graphics.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };


  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        # xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];

      wlr = {
        enable = true;
        settings = {
          screencast = {
            output_name = "eDP-1";
            max_fps = 60;
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
          };
        };
      };
    };
  };

}
