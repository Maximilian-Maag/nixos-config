{config, pkgs, ...}:

{
  virtualisation.docker.enable = true;
  security.apparmor.enable = false;
  users.users.mmaag.extraGroups = ["docker"];
  users.extraGroups.docker.members = [ "mmaag" ]; #use your username
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };

  virtualisation.docker.extraOptions = "--storage-driver=overlay2";

  # also adding docker-compose
  environment.systemPackages  = with pkgs;
  [
    docker-compose
  ];
}
