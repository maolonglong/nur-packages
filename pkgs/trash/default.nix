{ lib
, buildGoModule
, fetchFromGitHub
,
}:
buildGoModule {
  pname = "trash";
  version = "b889588";

  src = fetchFromGitHub {
    owner = "maolonglong";
    repo = "trash";
    rev = "b8895889ae80f3bb1efe9ecde85ed3220842e668";
    hash = "sha256-vmmxp0Wy8yenlHlDBBOQtiVjYiPPMv7yVfifDYAmXis=";
  };

  vendorHash = "sha256-3PnXB8AfZtgmYEPJuh0fwvG38dtngoS/lxyx3H+rvFs=";

  ldflags = [ "-s" "-w" ];

  checkFlags = [ "-skip=TestRm" ];

  meta = with lib; {
    homepage = "https://github.com/maolonglong/trash";
    description = "Move FILE(s) to the trash";
    license = licenses.mit;
    platforms = lib.platforms.darwin;
    mainProgram = "trash";
  };
}
