{ config, pkgs, ... }:

{
  # Enable the NixOS service for the user shell environment
  environment.systemPackages = with pkgs; [
    nodejs_22
    #yarn                    # Optional, if you prefer Yarn as package manager
    nodePackages."@angular/cli"             # This installs Angular CLI globally
  ];
}