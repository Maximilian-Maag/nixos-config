
{config, pkgs, ...}:

{
home-manager.users.mmaag = {
        programs.vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
                ms-python.python
                yzhang.markdown-all-in-one
                ms-vscode-remote.remote-ssh
                mhutchie.git-graph
                pkief.material-icon-theme
                oderwat.indent-rainbow
                bierner.markdown-emoji
                bierner.emojisense
                jnoortheen.nix-ide
                ms-dotnettools.csharp
                ms-dotnettools.csdevkit
                angular.ng-template
                dbaeumer.vscode-eslint
                naumovs.color-highlight
                bradlc.vscode-tailwindcss
            ];
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
}
