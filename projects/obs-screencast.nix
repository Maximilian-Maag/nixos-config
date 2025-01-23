{config, pkgs, lib,  ...}:

{
    home-manager.users.mmaag = {
            programs.obs-studio = {
                enable = true;
                plugins = with pkgs.obs-studio-plugins; [
                wlrobs
                obs-backgroundremoval
                obs-pipewire-audio-capture
                obs-composite-blur
            ];
        };
    };

    environment.systemPackages = with pkgs; 
    [
       davinci-resolve
       vlc
       ffmpeg-full
       v4l-utils
    ];

    boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
        boot.kernelModules = [
        "v4l2loopback"
    ];

    boot.extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    security.polkit.enable = true;

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            rocmPackages.clr.icd
        ];
    };
}