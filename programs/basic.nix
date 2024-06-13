# Config for common linux cli tools like git etc
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        git  # version control system
        bash # common known shell
        unzip # tool to make use of zip-archives
        nano # simple cli editor
        vscodium # vs code without ms telemetry
        android-tools
    ];
}
