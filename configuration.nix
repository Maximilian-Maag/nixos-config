# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# to use this configuration reference it in your nix-config in /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [ # Include other modules
      ./system/desktop-env/gnome.nix
      ./system/localization/de.nix
      ./system/audio/pipewire.nix
      ./programs/office.nix
      ./programs/basic.nix
      ./programs/browser/firefox.nix
      ./system/user/mmaag.nix
    ];

  networking.hostName = "workstation"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # setting nixos version
  system.stateVersion = "23.11"; # Did you read the comment?
}
