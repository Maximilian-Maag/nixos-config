# Config for common linux cli tools like git etc
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        git
        bash
        unzip
        busybox
    ];
}