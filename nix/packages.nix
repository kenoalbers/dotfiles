{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "shell-packages";
  paths = with pkgs; [
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
    # Work
    (azure-cli.withExtensions [ azure-cli.extensions.resource-graph ])
    powershell
  ];
}
