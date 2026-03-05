#!/bin/bash

# This script formats the *.nix files using nixfmt with the RFC style.
nix run nixpkgs#nixfmt-rfc-style -- ~/dotfiles/*.nix
