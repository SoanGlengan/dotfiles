{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slurp
    grim
    swww
    waybar
    foot
    wl-clipboard
    wtype
    mako

    nerd-fonts.dejavu-sans-mono
  ];


  xdg.autostart.enable = true;
  

  xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        # xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
  };

  services.swww.enable  = true;
  
  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.hyprland;

    xwayland.enable = true;

    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";

      env = [
        "HYPRCURSOR_THEME, Simp1e-Dark"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR, Simp1e-Dark"
        "XCURSOR_SIZE, 24"
        "QT_QPA_PLATFORMTHEME, qt5ct"
        "SDL_VIDEODRIVER, wayland"
        "GDK_BACKEND, wayland,x11"
      ];
      bindm = [
        "$mod , mouse:272, movewindow"
        "$mod , mouse:273, resizewindow"
      ];
      bind =
        [
          "$mod, F2, exec, firefox"
          "$mod, Return, exec, foot"
          "$mod, code:40, exec, rofi -show drun -show-icons"
          "$mod Shift, Q, killactive,"
          "$mod, space, togglefloating,"
          "$mod, f, fullscreen,"
          "$mod, t, togglegroup"
          "$mod, r, changegroupactive"
          
          "$mod, Print, exec, grim -g \"$(slurp -d)\" - | wl-copy -t image/png"
          # "Print, exec, grim - | wl-copy -t image/png"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
          "$mod SHIFT, n, togglesplit" 
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );

      monitor = [
        ",preferred,auto,auto"
        "eDP-1,preferred,auto,1"
      ];

      animations.enabled = false;

      input = {
        kb_layout = "us";
        
        touchpad = {
          scroll_factor = 0.4;
          natural_scroll = true;
        }; 
        force_no_accel = false;
        accel_profile = "adaptive";
        sensitivity = 0.2;
      };
      general = {
        gaps_in = 5;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "rgba(4f1ab2AA)";
        layout = "dwindle";
      };

      dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true;
          preserve_split = true;
          # special_scale_factor = 1;
          permanent_direction_override = true;
          # split_width_multiplier = 1;
          # force_split = 1;
          # preserve_split = true;
          # smart_resizing = false;
      };

      gestures = {
         # workspace_swipe = true;
          workspace_swipe_invert = true;
          # workspace_swipe_distance = 100;
          workspace_swipe_cancel_ratio = 0.5;
          # workspace_swipe_numbered = true;
          workspace_swipe_create_new = false;
      };

      misc = {
          disable_hyprland_logo = true;
          vfr = true;
          focus_on_activate = true;
      };

      exec-once = [
        "nm-applet -sm-disable"
        "waybar"
      ];
    };
  };
}
