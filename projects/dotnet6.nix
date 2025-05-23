{config, pkgs, home-manager, ... }:
let
  dotnet-full =
    with pkgs.dotnetCorePackages;
    combinePackages [
      sdk_6_0
      runtime_6_0
      aspnetcore_6_0
    ];

  deps = (
    ps:
    with ps;
    [
      rustup
      zlib
      openssl.dev
      pkg-config
      stdenv.cc
      cmake
      mono
      msbuild
    ]
    ++ [ dotnet-full ]
  );
in
{
  home-manager.users.mmaag.programs.vscode = {
    enable = true;
    package =
      (pkgs.vscode.overrideAttrs (prevAttrs: {
        nativeBuildInputs = prevAttrs.nativeBuildInputs ++ [ pkgs.makeWrapper ];
        postFixup =
          prevAttrs.postFixup
          + ''
            wrapProgram $out/bin/code \
              --set DOTNET_ROOT "${dotnet-full}" \
              --prefix PATH : "~/.dotnet/tools"
          '';
      })).fhsWithPackages
        (ps: deps ps);
    extensions = [ pkgs.vscode-extensions.sonarsource.sonarlint-vscode ];
  };
}