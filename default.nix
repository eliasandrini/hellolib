{ stdenv, cmake }:

stdenv.mkDerivation rec {
  pname = "hello library";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake ];
}