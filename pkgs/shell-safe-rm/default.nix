{
  stdenv,
  lib,
  fetchFromGitHub,
  bash,
  git,
  makeWrapper,
}:
stdenv.mkDerivation rec {
  pname = "shell-safe-rm";
  version = "3.1.1";

  src = fetchFromGitHub {
    owner = "kaelzhang";
    repo = "shell-safe-rm";
    rev = version;
    hash = "sha256-INgS5mAoUMhYc2DrxRq/g17D7Hsm9Ac5mwBCHwhx+XE=";
  };

  buildInputs = [bash git];
  nativeBuildInputs = [makeWrapper];

  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    cp bin/rm.sh $out/bin/safe-rm
    wrapProgram $out/bin/safe-rm \
      --prefix PATH : ${lib.makeBinPath buildInputs}
  '';

  meta = with lib; {
    description = "😎 Safe-rm: A drop-in and much safer replacement of bash rm with nearly full functionalities and options of the rm command! Safe-rm will act exactly the same as the original rm command.";
    homepage = "https://github.com/kaelzhang/shell-safe-rm";
    license = licenses.mit;
    mainProgram = "safe-rm";
    platforms = platforms.unix;
  };
}
