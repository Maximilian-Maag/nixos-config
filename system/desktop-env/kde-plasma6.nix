{ config, pkgs, ... }:

{
    # this config is ment for nixos 24.11
    services.xserver.enable = true; # optional
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.settings.General.DisplayServer = "mmaag";
    
    # specific clients for this desktop environment
    environment.systemPackages = with pkgs; [
        nextcloud-client
    ];
}
