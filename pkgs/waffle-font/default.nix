{ stdenv
, lib
, fetchgit
, mkfontscale
}:

stdenv.mkDerivation 
{
  name = "waffle-font";
  src = fetchgit 
  {
    url = "https://github.com/addy-dclxvi/bitmap-font-collections";
    sha256 = "13wkgdvl9j63mq221bcsrj5am8avddq8lijc7z30f1f1xq5jcw8z";
  };
  dontUnpack = true;
  nativeBuildInputs =
  [
    mkfontscale
  ];
  installPhase = 
  ''
    mkdir -p $out/share/fonts/
    cp $src/waffle-10.bdf $out/share/fonts/
    cd "$out/share/fonts"
    mkfontdir
    mkfontscale
  '';
  meta = with lib; {
    description = "bitmap-font";
    homepage = "https://github.com/addy-dclxvi/bitmap-font-collections";
    license = licenses.mit;
    maintainers = with maintainers; [ dan4ik605743 ];
    platforms = platforms.linux;
  };
}
