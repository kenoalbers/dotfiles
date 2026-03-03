# Setup symlinks using GNU Stow
cd stow && stow -t "$HOME" */

# Install software packages using Nix
nix run home-manager/master -- switch
