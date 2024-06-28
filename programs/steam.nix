# config file to install steam + settings for steam
{config, pkgs, ...}:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    # symlink games folder on different harddrive to default library folder of steam
    #system.userActivationScripts.linkSteamfolder.text = ''
    #    if [[ ! -h "$HOME/Games/Steam/" ]]; then
    #        ln -s "$HOME/Games/Steam/" "$HOME/.local/share/"
    #    fi
    #'';
}