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

    # fix unsupported gpu mode
    environment.systemPackages = with pkgs; 
    [
       davinci-resolve
    ];
}