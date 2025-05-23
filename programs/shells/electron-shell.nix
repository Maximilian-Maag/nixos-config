{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    electron
    electron-builder
    patchelf
    glib
    nss
    gtk3
    libnotify
  ];
}
