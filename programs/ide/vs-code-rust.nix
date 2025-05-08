
{config, pkgs, ...}:

{
programs.nix-ld.enable = true;
programs.nix-ld.package = pkgs.nix-ld;
home-manager.users.mmaag = {
        programs.vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
                rust-lang.rust-analyzer
                firefox-devtools.vscode-firefox-debug
            ];
                userSettings = {
            # General
            "editor.fontSize" = 16;
            "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
            "terminal.integrated.fontSize" = 14;
            "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
            "window.zoomLevel" = 1;
            "editor.multiCursorModifier" = "ctrlCmd";
            "workbench.startupEditor" = "none";
            "explorer.compactFolders" = false;
            # Whitespace
            "files.trimTrailingWhitespace" = true;
            "files.trimFinalNewlines" = true;
            "files.insertFinalNewline" = true;
            "diffEditor.ignoreTrimWhitespace" = false;
            # Git
            "git.enableCommitSigning" = true;
            "git-graph.repository.sign.commits" = true;
            "git-graph.repository.sign.tags" = true;
            "git-graph.repository.commits.showSignatureStatus" = true;
            # Other
            "dotnet.preferCSharpExtension" = true;
            "telemetry.telemetryLevel" = "off";
            "update.showReleaseNotes" = false;
            };
             keybindings = [
                {
                    key = "ctrl+y";
                    command = "editor.action.commentLine";
                    when = "editorTextFocus && !editorReadonly";
                }
                {
                    key = "ctrl+shift+7";
                    command = "-editor.action.commentLine";
                    when = "editorTextFocus && !editorReadonly";
                }
                {
                    key = "ctrl+d";
                    command = "workbench.action.toggleSidebarVisibility";
                }
                {
                    key = "ctrl+b";
                    command = "-workbench.action.toggleSidebarVisibility";
                }
            ];
        };
    };

    ## needed toolchain
    environment.systemPackages = with pkgs; [
        wget vim rustup gcc
    ];
}
