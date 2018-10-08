{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {} // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.10";
      identifier = {
        name = "wl-pprint-console";
        version = "0.1.0.2";
      };
      license = "MIT";
      copyright = "2017 Daniel Mendler";
      maintainer = "Daniel Mendler <mail@daniel-mendler.de>";
      author = "Daniel Mendler <mail@daniel-mendler.de>";
      homepage = "https://github.com/minad/wl-pprint-console#readme";
      url = "";
      synopsis = "Wadler/Leijen pretty printer supporting colorful console output.";
      description = "Wadler/Leijen pretty printer with support for annotations and colorful console output. Additional useful display routines are provided, e.g, for HTML output.";
      buildType = "Simple";
    };
    components = {
      "wl-pprint-console" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.colorful-monoids)
          (hsPkgs.text)
          (hsPkgs.wl-pprint-annotated)
        ];
      };
    };
  }