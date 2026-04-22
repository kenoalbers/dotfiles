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
    (azure-cli.withExtensions [
      azure-cli.extensions.resource-graph
      azure-cli.extensions.azure-devops
    ])
    powershell
    devcontainer
    tenv
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # Tools
    vim.enable = true;
    git.enable = true;
    bat.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    # Shell
    fish = {
      enable = true;
      shellInit = builtins.readFile ./configs/fish/shellInit.fish;
      interactiveShellInit =
        builtins.readFile ./configs/fish/interactiveShellInit.fish
        + "\n"
        + builtins.readFile ./configs/fish/tide.fish;
      plugins = [
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
      ];
    };
  };

  # Configure alacritty through home manager without being a nix package.
  # This helps to avoid issues with desktop applications on non-NixOS systems.
  xdg.configFile."alacritty/alacritty.toml".source = ./configs/alacritty/alacritty.toml;
}
