{ lib
, makeWrapper
, buildGoModule
, fetchFromGitHub
, nodejs-slim
,
}:
buildGoModule rec {
  pname = "fx";
  version = "31.0.0";

  src = fetchFromGitHub {
    owner = "antonmedv";
    repo = "fx";
    rev = "${version}";
    hash = "sha256-AVaMViu+65xyYW3TzIigNXf5FfKb2v+TU/BMZqCX/Js=";
  };

  vendorHash = "sha256-kE6JotKP3YQ0B3HvyNU3fTvuwbnqTW8cwGVBYpiBvso=";

  nativeBuildInputs = [ makeWrapper ];

  ldflags = [ "-s" "-w" ];

  postFixup = ''
    wrapProgram "$out/bin/fx" \
      --prefix PATH : "${lib.makeBinPath [ nodejs-slim ]}"
  '';

  meta = with lib; {
    homepage = "https://github.com/antonmedv/fx";
    description = "Terminal JSON viewer & processor";
    license = licenses.mit;
    mainProgram = "fx";
  };
}
