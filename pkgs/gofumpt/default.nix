{ lib
, buildGoModule
, fetchFromGitHub
,
}:
buildGoModule rec {
  pname = "gofumpt";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "mvdan";
    repo = "gofumpt";
    rev = "v${version}";
    hash = "sha256-94aaLqoalFredkxaSPgJEnFtKw7GmkkL5N+I8ws9zxY=";
  };

  vendorHash = "sha256-q8+Blzab9TLTRY2/KncIlVp53+K6YWzg1D0SS7FPM9I=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];

  checkFlags = [ "-skip TestScript/diagnose" ];

  meta = with lib; {
    homepage = "https://github.com/mvdan/gofumpt";
    description = "A stricter gofmt";
    license = licenses.bsd3;
    mainProgram = "gofumpt";
  };
}
