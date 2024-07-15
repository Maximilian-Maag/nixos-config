{ config, pkgs, ... }:

{
    # this config is ment for nixos 24.05
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.windowManager.stumpwm.enable = true;
    services.xserver.xkb.options = "ctrl:nocaps";
    services.libinput.enable = false; # Enable touchpad support

    # specific clients for this desktop environment
    environment.systemPackages = with pkgs; [
        nextcloud-client
    ];
}
