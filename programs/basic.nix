# Config for common linux cli tools like git etc
{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        git  # version control system
        gh # github cli
        bash # common known shell
        unzip # tool to make use of zip-archives
        nano # simple cli editor
        android-tools
        gscan2pdf
        libsForQt5.qt5.qtscxml
        scmccid # drivers for smartcard reader
        discord
    ];

    programs.ausweisapp =  {
        enable = true;
        openFirewall = true;
    };

    services.pcscd.enable = true;
}