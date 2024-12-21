
{ config, pkgs, lib, ... }:

# Import Angular CLI v19 package using packageCall
let
  angularCli = import ./angular-build.nix {
    lib = lib;               # Ensure pkgs.lib is passed
    stdenv = pkgs.stdenv;         # Ensure pkgs.stdenv is passed
    fetchurl = pkgs.fetchurl;     # Ensure pkgs.fetchurl is passed
    nodePackages = pkgs.nodePackages;  # Ensure pkgs.nodePackages is passed
  }; 
in

{
  environment.systemPackages = with pkgs; [
    angularCli
    nodejs_23
  ];

}