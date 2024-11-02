{ mkStarsectorMod }:
mkStarsectorMod rec {
  pname = "ashLib";
  version = "1.0.1";
  id = "ashlib";
  url = "https://drive.google.com/uc?export=download&id=1oFzNpFobDxpqrgymwqnvekN4sz6e3_Jx";
  hash = "sha256-Ze6RTWVrxthW/l9XUDWtwStuoZq1CVw/bhabSo004L8=";
  stripRoot = false;
  postUnpack = ''
    rm -rf source-${pname}-${version}/Ashlib
    mv source-${pname}-${version}/Ashlib_/* source-${pname}-${version}/
    rm -rf source-${pname}-${version}/Ashlib_
  '';
}
