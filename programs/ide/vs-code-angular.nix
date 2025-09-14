
{lib, config, pkgs, ...}:

{
programs.nix-ld.enable = true;
programs.nix-ld.package = pkgs.nix-ld;
home-manager.users.mmaag = {
        programs.vscode = {
            enable = true;
            profiles.default.extensions = with pkgs.vscode-extensions; [
                bierner.markdown-mermaid
                mhutchie.git-graph
                pkief.material-icon-theme
                oderwat.indent-rainbow
                bierner.markdown-emoji
                bierner.emojisense
                jnoortheen.nix-ide
                angular.ng-template
                dbaeumer.vscode-eslint
                naumovs.color-highlight
                bradlc.vscode-tailwindcss
                firefox-devtools.vscode-firefox-debug
            ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                name = "sqltools";
                publisher = "mtxr";
                version = "0.28.4";
                sha256 = "sha256-ExeerCI5yDa/DJqNOwENDjw+xhMPNil6JgCAUNdTXy8=";
                }
                {
                name = "sqltools-driver-pg";
                publisher = "mtxr";
                version = "0.5.5";
                sha256 = "sha256-B1wycDFSWPaQ87HF54+GrNX0b5f3tODLStuxqICdkjs=";
                }
            ];
                profiles.default.userSettings = {
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
            profiles.default.keybindings = [
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
}
