{ ... }:
{

  services = {
    xserver = {
      xkb = {
        layout = "us,us";
        variant = ",colemak";
        options = "grp:alt_shift_toggle,caps:ctrl_modifier";
      };

    };
};
}
