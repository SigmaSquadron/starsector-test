{ mkStarsectorMod }:
mkStarsectorMod rec {
  pname = "ashesOfTheDomainVaultsOfKnowledge";
  version = "2.4.11";
  id = "aotd_vok";
  url = "https://drive.google.com/uc?export=download&id=1rtCUH6htJqSs-nn8LLxxzAaUb4dkgOTU";
  hash = "sha256-avPaOCMpCWGJuqRJYyHFBQ68LkLWzYtvFPp6x+IWB18=";
  stripRoot = false;
  postUnpack = ''
    rm -rf source-${pname}-${version}/Ashlib_
    mv source-${pname}-${version}/Ashes\ of\ \ The\ Domain-\ Vaults\ of\ Knowledge/* source-${pname}-${version}
    rm -rf source-${pname}-${version}/Ashes\ of\ \ The\ Domain-\ Vaults\ of\ Knowledge
  '';
}
