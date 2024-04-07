# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include other modules
      /etc/nixos/hardware-configuration.nix
      ./system/desktop-env/gnome.nix
      ./system/localization/de.nix
      ./system/audio/pipewire.nix
      ./programs/office.nix
      ./system/user/mmaag.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
