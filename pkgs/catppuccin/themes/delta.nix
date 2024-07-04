{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "catppuccin_theme_delta";
  version = "unstable-2024-07-04";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "delta";
    rev = "48273a5e02486d871c6b25268ac6fb849d387eee";
    hash = "sha256-xXE91C7jckYK5IkOMX8frKQarBy3k6qlNjc/Zc0aBGU=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for delta";
    homepage = "https://github.com/catppuccin/delta";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
