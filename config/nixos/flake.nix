{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable }: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem{
      inherit system;
      modules = [
        ./configuration.nix
	./hosts/thinkpad.nix
	./modules/hyprland.nix
      ];
    };
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem{
      inherit system;
      modules = [
        ./configuration.nix
	./hosts/laptop.nix
	./modules/nvidia.nix
      ];
    };
  };
}
