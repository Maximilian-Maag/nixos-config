{ config, pkgs, lib, ... }:

let
  adblockLists = [
    "https://www.i-dont-care-about-cookies.eu/abp/"
    "https://easylist.to/easylist/easylist.txt"
    "https://easylist.to/easylist/easyprivacy.txt"
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt"
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt"
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt"
    "https://filters.adtidy.org/extension/ublock/filters/224.txt"
    "https://www.i-dont-care-about-cookies.eu/abp/"
    "https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt"
  ];
in
{
  environment.systemPackages = with pkgs; [
    qutebrowser
    mpv # vid player that will open video in detached window
    yt-dlp # used to stream vid from yt server
  ];

  # generate a script for add free youtube vids with home manager
  home-manager.users.mmaag = {
    home.file.".config/qutebrowser/youtube-to-vlc.sh" = {
      text = ''
        #!/usr/bin/env bash
        url="$1"
        mpv --ytdl-format="bestvideo[height<=1080]+bestaudio/best" "$url"
      '';
      executable = true;
    };

    programs.qutebrowser = {
      extraConfig = ''
      c.url.searchengines = {
        "DEFAULT": "https://duckduckgo.com/?q={}",
        "rd": "https://www.reddit.com/r/{}",
      }
      '';
      enable = true;
      settings = {
        content.blocking.enabled = true;
        content.blocking.method = "adblock";
        content.blocking.adblock.lists = adblockLists;
        fonts.default_size = "30pt";
        content.cookies.accept = "no-3rdparty";  # Fix here
        content.javascript.enabled = true;
        content.cookies.store = false;
        content.canvas_reading = false;

        # User agent spoofing
        content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0";
      };

      keyBindings.normal = {
        "M" = "hint links spawn --detach /home/mmaag/.config/qutebrowser/youtube-to-vlc.sh {hint-url}";
        "cr" = "jseval (function () { var i, elements = document.querySelectorAll(\"body *\"); for (i = 0; i < elements.length; i++) { var pos = getComputedStyle(elements[i]).position; if (pos === \"fixed\" || pos === \"sticky\") { elements[i].parentNode.removeChild(elements[i]); } } })();";
      };
    };
  };
}
