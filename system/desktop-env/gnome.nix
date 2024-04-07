# Contains configuration for gnome
{ config, pkgs, ...}:

{
    # currently utilizing x11
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
}