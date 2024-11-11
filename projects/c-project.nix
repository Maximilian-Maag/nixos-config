{config, pkgs, ...}:
#basic toolchain for c projects setup with nix

{
    # other libs for c maybe loaded here
    environment.systemPackages = with pkgs [
        gcc
        make
    ];
}