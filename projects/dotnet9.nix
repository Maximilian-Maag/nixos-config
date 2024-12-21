{config, pkgs, home-manager, ... }:
let
  dotnet-full =
    with pkgs.dotnetCorePackages; # change number for different dotnet setup
    combinePackages [
      dotnet_9.sdk
      dotnet_9.runtime
      dotnet_9.aspnetcore
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