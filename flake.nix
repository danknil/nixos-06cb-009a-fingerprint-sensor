{
  description = "Provides packages, modules and functions for the 06cb:009a fingerprint sensor.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
  } @ inputs: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
    inherit (self) outputs;
  in {
    packages.x86_64-linux = import ./pkgs pkgs;
    nixosModules = import ./modules {inherit outputs inputs;};
  };
}
