# Install software packages using Nix
nix-env -i -f "$HOME/dotfiles/nix/packages.nix"

# Setup symlinks using GNU Stow
cd stow && stow -t "$HOME" */