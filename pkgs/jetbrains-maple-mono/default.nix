{
  lib,
  stdenvNoCC,
  unzip,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "jetbrains-maple-mono";
  version = "1.2304.73";
  src = fetchurl {
    url = "https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${version}/JetBrainsMapleMono-XX-XX-XX.zip";
    hash = "sha256-ER1kXVqmejJ02GLsQBeMItZqA3mu8OExzaHK02PFEAQ=";
  };

  sourceRoot = ".";
  nativeBuildInputs = [unzip];
  installPhase = ''
    find . -name '*.ttf' -exec install -Dt $out/share/fonts/truetype {} \;
  '';

  meta = with lib; {
    homepage = "https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono";
    description = "JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
