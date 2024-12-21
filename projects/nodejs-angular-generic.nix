{ config, pkgs, ... }:

{
  # Enable the NixOS service for the user shell environment
  environment.systemPackages = with pkgs; [
    nodejs_23
    #nodePackages."@angular/cli"             # This installs Angular CLI globally
  ];
}