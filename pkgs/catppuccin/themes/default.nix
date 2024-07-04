{
  lib,
  newScope,
}:
lib.makeScope newScope (
  self:
    with self; {
      alacritty = callPackage ./alacritty.nix {};
      bat = callPackage ./bat.nix {};
      delta = callPackage ./delta.nix {};
      starship = callPackage ./starship.nix {};
    }
)
