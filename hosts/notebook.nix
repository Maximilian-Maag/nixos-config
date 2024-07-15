{ config, pkgs, ... }:

{
  imports =
    [ # Include other modules
      ../system/desktop-env/gnome.nix
      ../system/localization/de.nix
      ../system/audio/pipewire.nix
      ../programs/office.nix
      ../programs/basic.nix
      ../programs/browser/firefox.nix
      ../system/user/mmaag.nix
    ];

  networking.hostName = "mmaag-notebook"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # setting nixos version
  # system.allowReboot = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}