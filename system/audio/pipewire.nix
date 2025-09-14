# This file configers pipewire as audio system for your computer. Pls note that pulesaudio will
# be deactivated to prevent compatability issues.

{config, pkgs, ...}:

{
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
