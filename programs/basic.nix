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
        # online id
        pcsclite
        libusb1  
    ];

    # services for online id
    services.pcscd.enable = true;
    services.pcscd.plugins = [ pkgs.acsccid ];
    # enable scanner
    hardware.sane.enable = true;
}
