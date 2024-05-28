{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    #services.xserver.displayManager.lightdm.background = "somepath";
    services.xserver.windowManager.stumpwm.enable = true;
    services.xserver.xkbOptions = "ctrl:nocaps";
    services.xserver.libinput.enable = true; # Enable touchpad support

    # specific clients for this desktop environment
    environment.systemPackages = [
    	pkgs.nextcloud-client
    ];
}
