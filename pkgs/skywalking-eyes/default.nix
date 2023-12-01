{ lib
, buildGoModule
, fetchFromGitHub
,
}:
buildGoModule rec {
  pname = "skywalking-eyes";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "apache";
    repo = "skywalking-eyes";
    rev = "v${version}";
    hash = "sha256-ETcCsoS8fVSNZPajvptR8xvjokoMQ6TynNebFJePv58=";
  };

  vendorHash = "sha256-2/sW0I96YYmtK4yFrDYCRkOkcSXwtUEBIKiokzsd71U=";

  subPackages = [ "cmd/license-eye" ];

  ldflags = [ "-s" "-w" "-X github.com/apache/skywalking-eyes/commands.version=${version}" ];

  meta = with lib; {
    homepage = "https://github.com/apache/skywalking-eyes";
    description = "A full-featured license tool to check and fix license headers and resolve dependencies' licenses";
    license = licenses.asl20;
    mainProgram = "license-eye";
  };
}
