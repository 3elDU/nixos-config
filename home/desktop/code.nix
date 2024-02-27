{ pkgs, input, ... }: let
  extensions = input.nix-vscode-extensions.extensions.x86_64-linux;
in {
  programs.vscode = {
    enable = true;
    extensions = with extensions.vscode-marketplace; [
      vue.volar vue.vscode-typescript-vue-plugin
      golang.go
      bradlc.vscode-tailwindcss

      eamodio.gitlens
    ];
  };
}
