# This file is a sample for user configuration
{ config, pkgs, ...}:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in
{
    # include home manager to configer user settings
    imports = [
        (import "${home-manager}/nixos")
    ];
    
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mmaag = {
        isNormalUser = true;
        description = "Maximilain Jakob Maag";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    home-manager.users.mmaag = {
        programs.git = {
            enable = true;
            userName  = "Maximilian-Maag";
            userEmail = "maximilian.maag@outlook.de";
        };
        home.stateVersion = "23.11";
    };
}