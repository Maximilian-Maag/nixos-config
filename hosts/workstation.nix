{ config, pkgs, ... }:

{
  imports =
    [ # Include other modules
      ../system/desktop-env/kde-plasma6.nix
      ../system/localization/de.nix
      ../system/audio/pipewire.nix
      ../programs/office.nix
      ../programs/basic.nix
      ../programs/docker.nix
      ../programs/steam.nix
      ../programs/browser/firefox.nix
      ../programs/latex.nix
      ../system/home-manager.nix
      ../system/user/mmaag.nix
    ];

  networking.hostName = "workstation"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # setting nixos version
  # system.allowReboot = true;
  system.stateVersion = "24.05"; # Did you read the comment?
  services.printing.cups-pdf.enable = true;
}
