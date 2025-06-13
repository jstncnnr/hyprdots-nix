{
  description = "Justin's Hyprland config";

  outputs = inputs: {
    nixosModules = {
      default = import ./modules/nixos;
    };

    homeModules = {
      default = import ./modules/home;
    };
  };
}
