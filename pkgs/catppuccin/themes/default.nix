{
  lib,
  newScope,
}:
lib.makeScope newScope (
  self:
    with self; {
      starship = callPackage ./starship.nix {};
    }
)
