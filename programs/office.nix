# Configuration ment to provide pkgs for an office environment
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        # office
        thunderbird # email
        slack # communication
        libreoffice # office suit
    ];
}