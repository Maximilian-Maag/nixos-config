# Configuration ment to provide pkgs for an office environment
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        # office
        texstudio
        thunderbird # email
        teams-for-linux
        libreoffice # office suit
    ];
}