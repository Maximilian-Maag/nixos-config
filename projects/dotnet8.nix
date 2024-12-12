{config, pkgs, home-manager, ... }:
let
  dotnet-full =
    with pkgs.dotnetCorePackages; # change number for different dotnet setup
    combinePackages [
      sdk_8_0_3xx
      dotnet_8.runtime
      dotnet_8.aspnetcore
    ];
in
{

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
    "dotnet-sdk-wrapped-6.0.428"
  ];


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
    dotnet-ef
  ];
}