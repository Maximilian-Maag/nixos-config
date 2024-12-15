# This file configers pulesaudio as audio system for your computer. Pls note that pulesaudio will
# be deactivated to prevent compatability issues.

{config, pkgs, ...}:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

    services.pipewire.extraConfig.pipewire."virt-mic-setup" = {
    "context.objects" = [
      {
        # A default dummy driver. This handles nodes marked with the "node.always-driver"
        # properyty when no other driver is currently active. JACK clients need this.
        factory = "spa-node-factory";
        args = {
          "factory.name"     = "support.node.driver";
          "node.name"        = "Dummy-Driver";
          "priority.driver"  = 8000;
        };
      }
      {
        factory = "adapter";
        args = {
          "factory.name"     = "support.null-audio-sink";
          "node.name"        = "audiosink";
          "node.description" = "audiosink";
          "media.class"      = "Audio/Sink";
          "audio.position"   = "FL,FR";
        };
      }
    ];
  };

  # copy paste the following line to ~/home/usr/.bashrc
  # This process can't be automated yet.
  # pactl load-module module-virtual-source source_name=virtual-mic-use-me master=audiosink.monitor

  systemd.user.services.setupmic = {
    description = "Run bash command on reboot to setup virtual mic";
    wantedBy = [ "default.target" ];  # This makes the service run on system startup
    # If you just want to run a one-liner command instead of a script, use:
    serviceConfig.Restart = "always";
    #serviceConfig.Environment = "PULSE_SERVER=unix:/run/user/1000/pulse/native";
    serviceConfig.ExecStart = "/run/current-system/sw/bin/pactl load-module module-virtual-source source_name=default master=audiosink.monitor";
  };

}