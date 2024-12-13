# This file configers pulesaudio as audio system for your computer. Pls note that pulesaudio will
# be deactivated to prevent compatability issues.

{config, pkgs, ...}:

{
    # Enable sound with pulesaudio.
    hardware.pulseaudio.enable = true;
    nixpkgs.config.pulseaudio = true;
}