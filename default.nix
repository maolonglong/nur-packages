# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  catppuccinThemes = pkgs.callPackage ./pkgs/catppuccin/themes {};
  gotosocial = pkgs.callPackage ./pkgs/gotosocial {};
  jetbrains-maple-mono = pkgs.callPackage ./pkgs/jetbrains-maple-mono {};
  shell-safe-rm = pkgs.callPackage ./pkgs/shell-safe-rm {};
  skywalking-eyes = pkgs.callPackage ./pkgs/skywalking-eyes {};
}
