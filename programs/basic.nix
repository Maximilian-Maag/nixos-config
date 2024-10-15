# Config for common linux cli tools like git etc
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        git  # version control system
        bash # common known shell
        unzip # tool to make use of zip-archives
        nano # simple cli editor
        android-tools
        gscan2pdf
        libsForQt5.qt5.qtscxml
        ausweisapp
        scmccid # drivers for smartcard reader
    ];
    programs.ausweisapp.openFirewall = true;
    services.pcscd.enable = true;
}