{
  description = "Justin's Hyprland config";

  outputs = {
    nixosModules = {
      default = import ./modules/nixos;
    };

    homeModules = {
      default = import ./modules/home;
    };
  };
}
