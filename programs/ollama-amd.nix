{config, pkgs, ...}:

{
    services.ollama = {
        enable = true;
        acceleration = "rocm";
        environmentVariables = {
            HCC_AMDGPU_TARGET = "gfx1101"; # used to be necessary, but doesn't seem to anymore
        };
        rocmOverrideGfx = "1101"; # this value depends on your machine
    };
}