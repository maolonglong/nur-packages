{
  lib,
  fetchurl,
  fetchFromGitHub,
  buildGoModule,
  nixosTests,
}: let
  owner = "superseriousbusiness";
  repo = "gotosocial";

  version = "0.18.0-rc1";

  web-assets = fetchurl {
    url = "https://github.com/${owner}/${repo}/releases/download/v${version}/${repo}_${version}_web-assets.tar.gz";
    hash = "sha256-otDXnwdeA0OFIAKRRs6BQ4akJ7S+TZtmSupZNxG2Fcw=";
  };
in
  buildGoModule rec {
    inherit version;
    pname = repo;

    src = fetchFromGitHub {
      inherit owner repo;
      tag = "v${version}";
      hash = "sha256-Z9gJyHQDHJBtBxB+Tp8jbaJ2wBdqzWF0DMD1nmCL8iA=";
    };

    patches = [./skip-useragent-middleware.patch];

    vendorHash = null;

    subPackages = ["cmd/gotosocial"];

    CGO_ENABLED = 0;
    ldflags = [
      "-s"
      "-w"
      "-extldflags"
      "-static"
      "-X main.Version=${version}"
    ];

    tags = [
      "netgo"
      "osusergo"
      "static_build"
      "kvformat"
      "timetzdata"
    ];

    postInstall = ''
      tar xf ${web-assets}
      mkdir -p $out/share/gotosocial
      mv web $out/share/gotosocial/
    '';

    # tests are working only on x86_64-linux
    # doCheck = stdenv.hostPlatform.isLinux && stdenv.hostPlatform.isx86_64;
    # checks are currently very unstable in our setup, so we should test manually for now
    doCheck = false;

    checkFlags = let
      # flaky / broken tests
      skippedTests = [
        # See: https://github.com/superseriousbusiness/gotosocial/issues/2651
        "TestPage/minID,_maxID_and_limit_set"
      ];
    in ["-skip=^${builtins.concatStringsSep "$|^" skippedTests}$"];

    passthru.tests.gotosocial = nixosTests.gotosocial;

    meta = with lib; {
      homepage = "https://gotosocial.org";
      changelog = "https://github.com/superseriousbusiness/gotosocial/releases/tag/v${version}";
      description = "Fast, fun, ActivityPub server, powered by Go";
      longDescription = ''
        ActivityPub social network server, written in Golang.
        You can keep in touch with your friends, post, read, and
        share images and articles. All without being tracked or
        advertised to! A light-weight alternative to Mastodon
        and Pleroma, with support for clients!
      '';
      maintainers = with maintainers; [blakesmith];
      license = licenses.agpl3Only;
    };
  }
