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
    ];

    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
            rocmPackages.clr.icd
        ];
    };
}