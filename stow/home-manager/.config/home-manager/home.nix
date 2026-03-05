{ config, pkgs, ... }:

{
  # Home Manager User
  home.username = "kenoalbers";
  home.homeDirectory = "/home/kenoalbers";

  # Warning: Check release-notes before updating
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    # Shell
    lsd
    # Basic
    htop

    # Azure / IaC / Microsoft
    (azure-cli.withExtensions [ azure-cli.extensions.resource-graph ])
    powershell
    devcontainer
  ];

  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./fish/shellInit.fish;
    interactiveShellInit = builtins.readFile ./fish/interactiveShellInit.fish + "\n" + builtins.readFile ./fish/tide.fish;

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
  };
  programs.vim.enable = true;
  programs.git.enable = true;
  programs.fzf = {
   enable = true;
   enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.bat.enable = true;

  home.file = {

  };

  # Configure alacritty through home manager without beeing a nix package.
  # This helps to avoid issues with desktop application on non nixos systems.
  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;

  home.sessionVariables = {

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}