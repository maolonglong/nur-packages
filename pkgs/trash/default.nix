{ lib
, buildGoModule
, fetchFromGitHub
,
}:
buildGoModule {
  pname = "trash";
  version = "dcabfbc";

  src = fetchFromGitHub {
    owner = "maolonglong";
    repo = "trash";
    rev = "dcabfbcfe5bb5b7ada788d797450c364f7d9d35e";
    hash = "sha256-MG1KQy8mOFemHOf+uswLye7Pkxq90nYTICFxezq9xEE=";
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
