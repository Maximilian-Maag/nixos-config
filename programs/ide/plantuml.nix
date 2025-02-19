{ config, lib, pkgs, ... }:

{
    environment.systemPackages = [
        pkgs.plantuml-c4
    ];
}