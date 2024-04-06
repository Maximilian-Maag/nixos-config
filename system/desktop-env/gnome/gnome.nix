# Config holding settings for gnome desktop environment

{config, pkgs, ...}:
{
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
}