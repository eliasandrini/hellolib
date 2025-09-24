{ stdenv, cmake, HelloWorldLibrary }:

stdenv.mkDerivation rec {
  pname = "hello app";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake ];
  buildInputs = [hellolib]
}