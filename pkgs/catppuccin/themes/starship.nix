{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "catppuccin_theme_starship";
  version = "unstable-2024-05-24";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "starship";
    rev = "5906cc369dd8207e063c0e6e2d27bd0c0b567cb8";
    hash = "sha256-FLHjbClpTqaK4n2qmepCPkb8rocaAo3qeV4Zp1hia0g=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Starship";
    homepage = "https://github.com/catppuccin/starship";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
