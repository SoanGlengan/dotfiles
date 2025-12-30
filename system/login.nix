{ pkgs, ... }:
{

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users.ansel = {
      shell = pkgs.zsh;
      group = "wheel";
      isNormalUser = true;
      extraGroups = [
        "video"
        "networkmanager"
        "dialout"
        "plugdev"
        "docker"
        "adbusers"
      ];
      packages = with pkgs; [ ];
    };

  };

}
