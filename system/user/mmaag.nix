# This file is a sample for user configuration
{ config, pkgs, ...}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mmaag = {
        isNormalUser = true;
        description = "Maximilain Jakob Maag";
        extraGroups = [ "networkmanager" "wheel" ];
    };
}