{ config, pkgs, ... }:

{
  imports =
    [ # Include other modules
      ../system/desktop-env/kde-plasma6.nix
      ../system/localization/de.nix
      ../system/audio/pipewire-with-virt-mic.nix
      ../programs/basic.nix
      ../programs/docker.nix
      ../programs/browser/firefox.nix
      ../system/home-manager.nix
      ../system/user/mmaag.nix
      ../programs/ollama-amd.nix
      ../programs/ide/rider.nix
      ../programs/ide/vs-code-angular.nix
      ../programs/ide/latex.nix
      ../programs/basic.nix
      ../programs/office.nix
      ../system/bluetooth.nix
      ../projects/obs-screencast.nix
    ];

  networking.hostName = "workstation"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # setting nixos version
  # system.allowReboot = true;
  system.stateVersion = "24.11"; # Did you read the comment?
  services.printing.cups-pdf.enable = true;
}
