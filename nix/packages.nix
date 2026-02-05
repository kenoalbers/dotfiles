{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "shell-packages";
  paths = with pkgs; [
    vim
    fish
    git
    zoxide
    lsd
    bat
  ];
}
