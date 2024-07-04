{
  lib,
  newScope,
}:
lib.makeScope newScope (
  self:
    with self; {
      alacritty = callPackage ./alacritty.nix {};
      starship = callPackage ./starship.nix {};
    }
)
