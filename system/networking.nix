{ ... }:
{
  networking = {
    networkmanager.enable = true;

    firewall.allowedTCPPorts = [
      6081
      5900
      62895
      11311
      14438
    ];
    firewall.allowedUDPPorts = [
      6081
      5900
      62895
      11311
      14438
    ];
    firewall.enable = false;

    # nameservers = [
    #   "8.8.8.8"
    #   "8.8.4.4"
    # ];

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  };

  services = {
    tailscale = {
      enable = true;
    };
  };
}
