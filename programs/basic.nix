# Config for common linux cli tools like git etc
{config, pkgs, ...}:

{

    home-manager.users.mmaag = {
        home.sessionVariables = {
            DISTROBOX_EXPORT_DIR = "/home/mmaag/.local/bin/distrobox-exports";
        };
    };

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
        distrobox
    ];

    programs.ausweisapp =  {
        enable = true;
        openFirewall = true;
    };

    services.pcscd.enable = true;
}
