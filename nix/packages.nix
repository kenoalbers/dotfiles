{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "shell-packages";
  paths = with pkgs; [
    git
    zoxide
    lsd
    bat
  ];
}
