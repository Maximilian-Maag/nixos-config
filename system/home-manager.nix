{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.mmaag = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.11"; #18.09
    nixpkgs.config.allowUnfree = true;
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
  };
}