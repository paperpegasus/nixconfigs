{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfreePredicate =
            pkg:
            builtins.elem (nixpkgs.lib.getName pkg) [
              "discord"
              "google-chrome"
              "broadcom-sta-6.30.223.271-57-6.12.39"
              "aspell-dict-en-science"
            ];
          permittedInsecurePackages = [
            "ventoy-1.1.05"
          ];
        };
      };
    in
    {
      # use "nixos", or your hostname as the name of the configuration
      # it's a better practice than "default" shown in the video
      nixosConfigurations.darkhorse = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/darkhorse/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              verbose = true;
              backupFileExtension = "home_backup";
              users.paperpegasus = import ./hosts/darkhorse/home.nix;
              useGlobalPkgs = true; # if true dont use private instance of pkgs which is the default
              useUserPackages = false; # if false ... uses nix-profile for home apps
              extraSpecialArgs = { inherit inputs pkgs system; };
            };
          }
        ];
      };
    };
}
