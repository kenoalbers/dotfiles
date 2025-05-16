{
  description = "A very complex flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { 
      system = "x86_64-linux";
      modules = [
	./configuration.nix
      ];
      specialArgs = {
         inherit nixpkgs-unstable;
      };
    };
  };
}
