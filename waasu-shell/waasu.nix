{ lib, pkgs, stdenv, fetchurl, fetchgit, fetchFromGitHub, buildInputs,}:


stdenv.mkDerivation rec {
  pname = "waasu";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "jwc20";
    repo = "waasu";
    rev = "v${version}";
    sha256 = "0lkwyjcfq03jx2x7s1ipp60ja7m8vvqcqjk187vgncrd487r37h8";

  };

  buildInputs = [ 
    pkgs.beautifulsoup4
    pkgs.lxml
    pkgs.requests
    pkgs.selenium
    pkgs.pprintpp
    pkgs.python-dotenv
  ];
}


