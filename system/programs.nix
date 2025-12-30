{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;

    adb.enable = true;

    sway = {
      enable = true;
    };

    light.enable = true; # Volume and brightness key

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };


    mtr.enable = true;

    xfconf.enable = true;

    dconf.enable = true; # gtk fix

  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix!
    helix
    wget
    lxqt.lxqt-policykit
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.dejavu-sans-mono
    xkcd-font
    charis-sil
  ];
}
