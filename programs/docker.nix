{config, pkgs, ...}:

{
  virtualisation.docker.enable = true;
  users.users.mmaag.extraGroups = [ "docker" ];
  users.extraGroups.docker.members = [ "mmaag" ];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}