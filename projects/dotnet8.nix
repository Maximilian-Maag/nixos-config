{config, pkgs, home-manager, ... }:
let
  dotnet-full =
    with pkgs.dotnetCorePackages; # change number for different dotnet setup
    combinePackages [
      sdk_8_0
      runtime_8_0
      aspnetcore_8_0
    ];
in
{
  environment.systemPackages = with pkgs; 
  [
    dotnet-full
    rustup
    zlib
    openssl.dev
    pkg-config
    stdenv.cc
    cmake
    mono
    msbuild
  ];
}