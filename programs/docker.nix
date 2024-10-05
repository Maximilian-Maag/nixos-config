{config, pkgs, ...}:

{
  virtualisation.docker.enable = true;
  users.users.mmaag.extraGroups = [ "docker" ];
  users.extraGroups.docker.members = [ "mmaag" ]; #use your username
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # also adding docker-compose
  environment.systemPackages  = with pkgs;
  [
    docker-compose
  ];
}