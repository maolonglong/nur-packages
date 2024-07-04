{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "catppuccin_theme_bat";
  version = "unstable-2024-04-25";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
    hash = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Bat";
    homepage = "https://github.com/catppuccin/bat";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
