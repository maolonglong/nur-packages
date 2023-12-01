{ lib
, buildGoModule
, fetchFromGitHub
,
}:
buildGoModule rec {
  pname = "gofumpt";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "mvdan";
    repo = "gofumpt";
    rev = "v${version}";
    hash = "sha256-3buGLgxAaAIwLXWLpX+K7VRx47DuvUI4W8vw4TuXSts=";
  };

  vendorHash = "sha256-W0WKEQgOIFloWsB4E1RTICVKVlj9ChGSpo92X+bjNEk=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];

  checkFlags = [ "-skip TestScript/diagnose" ];

  meta = with lib; {
    homepage = "https://github.com/mvdan/gofumpt";
    description = "A stricter gofmt";
    license = licenses.bsd3;
    mainProgram = "gofumpt";
  };
}
