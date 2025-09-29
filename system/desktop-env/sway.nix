{ config, pkgs, lib, ... }:

{
  # Base system setup
  services.dbus.enable = true;

  # Enable GNOME Keyring for secret management
  services.gnome.gnome-keyring.enable = true;

  # Enable polkit (required for things like mounting drives)
  #programs.polkit.enable = true;

  # Greeter / Login Manager (CLI-based, works well with Wayland)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "mmaag"; # <<< CHANGE THIS
      };
    };
  };

  # Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # GTK apps in Wayland
    extraPackages = with pkgs; [
      foot        # Terminal emulator (Wayland native)
      waybar      # Status bar
      mako        # Notification daemon
      grim
      slurp       # Screenshot tools
      wl-clipboard
      swaybg      # Background setter
      kanshi      # Automatic display profile management
      brightnessctl
      playerctl   # Media control
      networkmanagerapplet # System tray applet for networking
    ];
  };

  # System packages (global)
  environment.systemPackages = with pkgs; [
    # GUI Apps
    gimp
    libreoffice

    # Polkit agent (needed for permissions)
    lxqt.lxqt-policykit

    # Fonts
    noto-fonts
    noto-fonts-emoji
    dejavu_fonts
    liberation_ttf
  ];

  # Network
  networking.networkmanager.enable = true;

  # Wayland environment variables
  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1"; # Firefox Wayland support
    _JAVA_AWT_WM_NONREPARENTING = "1"; # Java apps
  };

  # Input support (optional but nice)
  services.libinput.enable = true;

  # User must be in relevant groups
  users.users."your-username" = { # <<< CHANGE THIS
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };

  # Optional: allow unfree packages (for some proprietary drivers/apps)
  nixpkgs.config.allowUnfree = true;
}
