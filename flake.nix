{
  description = "Home Manager configuration of ichal";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/hoome-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... };
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        ichal = home-manager.lib.homeManagerConguration {
          inherit pkgs;

          modules = [ ./home/nix ];
        };
      };
    }; 
}
