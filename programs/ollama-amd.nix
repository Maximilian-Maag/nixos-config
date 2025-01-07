{config, pkgs, ...}:
# use this config to run ai models locally on amd gpus
{
    services.ollama = {
        enable = true;
        acceleration = "rocm";
        rocmOverrideGfx = "11.0.1";
    };
}