{pkgs, config, ...}:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["mmaag"]; # your user name here
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
