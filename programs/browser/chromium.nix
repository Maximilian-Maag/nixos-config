{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        (chromium.override { 
            commandLineArgs = [
                "--enable-features=VaapiVideoDecodeLinuxGL"
                "--ignore-gpu-blocklist"
                "--enable-zero-copy"
            ];
            enableWideVine = true; # allows drm content
            })
    ];
}