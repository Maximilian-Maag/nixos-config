# Configuration ment to provide pkgs for an office environment
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        # office
        texstudio
        thunderbird # email
        teams # communication
        libreoffice # office suit
    ];

    nixpkgs.config.allowUnsupportedSystem = true;
}