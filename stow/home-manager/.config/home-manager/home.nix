{ config, pkgs, ... }:

{
  # Home Manager User
  home.username = "kenoalbers";
  home.homeDirectory = "/home/kenoalbers";

  # Warning: Check release-notes before updating
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    # Desktop applications
    protonmail-desktop

    # Shell
    lsd

    # Basic
    htop

    # Azure / IaC / Microsoft
    (azure-cli.withExtensions [ azure-cli.extensions.resource-graph ])
    powershell
    devcontainer
  ];

  programs.alacritty = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./alacritty/alacritty.toml);
  };


  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./fish/shellInit.fish;
    interactiveShellInit = 
      builtins.readFile ./fish/interactiveShellInit.fish +
      builtins.readFile ./fish/tide.fish;

    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];
  };
  programs.vim.enable = true;
  programs.git.enable = true;
  programs.fzf.enable = true;
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.bat.enable = true;

  home.file = {
    
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kenoalbers/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
