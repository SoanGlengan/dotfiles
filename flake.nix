{
  description = "Home Manager configuration of silas";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    waveforms.url = "github:liff/waveforms-flake";
    frc-nix.url = "github:frc4451/frc-nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nix-colors,
      nixos-hardware,
      waveforms,
      frc-nix,
      spicetify-nix,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true; # For things like Nvidia drivers
          nvidia.acceptLicense = true;
        };
      };

    in
    {
      devShells.x86_64-linux.default = let pkgs = nixpkgs.legacyPackages.x86_64-linux; in pkgs.mkShell {
        buildInputs = [
          frc-nix.packages.x86_64-linux.glass
          frc-nix.packages.x86_64-linux.advantagescope
        ];
      };
      homeConfigurations."ansel" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix
          spicetify-nix.homeManagerModules.spicetify
           ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit nix-colors; };
      };

      nixosConfigurations.envy = nixpkgs.lib.nixosSystem {
        inherit pkgs;

        modules = [
          nixos-hardware.nixosModules.framework-16-7040-amd # hardware config from: https://github.com/NixOS/nixos-hardware/blob/master/flake.nix
          ./system
          ./hosts/envy/configuration.nix
          # waveforms.nixosModule
        ];
      };
    };
}
