{config, pkgs, lib,  ...}:

{
    home-manager.users.mmaag = {
        programs.obs-studio = {
         enable = true;
         plugins = with pkgs.obs-studio-plugins; [
         wlrobs
         obs-backgroundremoval
         obs-pipewire-audio-capture
        ];
        };
    };

    environment.systemPackages = with pkgs; 
    [
       davinci-resolve
       vlc
       ffmpeg-full
    ];

    boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
        boot.kernelModules = [
        "v4l2loopback"
    ];

    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
            rocmPackages.clr.icd
        ];
    };
}