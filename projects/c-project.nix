{config, pkgs, ...}:
#basic toolchain for c projects setup with nix

{
    # other libs for c maybe loaded here
    # use your own IDE xd
    environment.systemPackages = with pkgs; 
    [
        gcc
        gnumake
        cmocka
        cmake
    ];
}