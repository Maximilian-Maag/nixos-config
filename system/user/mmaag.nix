# This file is a sample for user configuration
{ config, pkgs, ...}:

{
    # include home manager to configer user settings
    imports = 
    [
        ./home-manager.nix
    ];
    
    # enable home manager
    home-manager.users.mmaag = {
        /* The home.stateVersion option does not have a default and must be set */
        home.stateVersion = "23.11";
        programs.git = {
            enable = true;
            userName  = "Maximilian-Maag";
            userEmail = "maximilian.maag@outlook.de";
        };
        /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mmaag = {
        isNormalUser = true;
        description = "Maximilain Jakob Maag";
        extraGroups = [ "networkmanager" "wheel" ];
    };
}