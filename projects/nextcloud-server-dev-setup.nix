# This file should be used when you work directly with the nc server code
# for nc app development use the recomendet docker-compose approach.
# php
# database server
# webserver

{config, pkgs, ...}:

{
    # packages
    environment.systemPackages = with pkgs; [
        php81 # php
        nodejs_22 # npm toolchain
    ];

    # database with postgres
    services.postgresql = {
    enable = true;
    ensureDatabases = [ "nextcloud" ];
    authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
    '';
    };

    # webserver
    # TODO Webserver config here

}