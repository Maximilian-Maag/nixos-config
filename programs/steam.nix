# config file to install steam + settings for steam
{config, pkgs, ...}:

{
    # symlink games folder on different harddrive to default library folder of steam
    programs.steam = {
        enable = true;
        # Open ports in the firewall for Steam Remote Play
        remotePlay.openFirewall = true; 
        # Open ports in the firewall for Source Dedicated Server
        dedicatedServer.openFirewall = true;
    };
}