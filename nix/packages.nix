{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "shell-packages";
  paths = with pkgs; [
    # Desktop applications
    protonmail-desktop
    # Shell
    fish
    vim
    lsd
    zoxide
    bat
    fzf
    # Basic
    git
    htop
    # Azure / IaC / Microsoft
    (azure-cli.withExtensions [ azure-cli.extensions.resource-graph ])
    powershell
    devcontainer
  ];
}
