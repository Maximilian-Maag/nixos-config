# python-env.nix
{ config, pkgs, lib, ... }:

let
  # Define a Python environment with desired packages (FAISS, numpy, scipy, etc.)
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    # a generic collection for data since and ai stuff
    requests
    python-dotenv
    aiofiles
    # Add any other dependencies you need
  ]);
in
{
  # The `environment.systemPackages` lists the packages that will be installed globally
  config = {
    environment.systemPackages = [
      pythonEnv  # This will install the custom Python environment globally
    ];

    home-manager.users.mmaag = {
        # IDE with python syntax highlighting
        programs.vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
                ms-python.python
                yzhang.markdown-all-in-one
            ];
        };
    };
  };
}
