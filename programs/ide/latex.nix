{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        texliveFull
        (
            vscode-with-extensions.override {
                vscode = vscodium;
                vscodeExtensions = with vscode-extensions; [
                    james-yu.latex-workshop
                ];
            }
        )
    ];
}