{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    rustc
    cargo
    pkg-config
    webkitgtk_4_1
    gtk3
    glib
    gdk-pixbuf
    cairo
    pango
    atk
    libsoup
    openssl
    curl
    dbus
    alsa-lib
    udev
  ];

  shellHook = ''
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
  '';
}
