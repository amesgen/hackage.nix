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
        name = "first-class-families";
        version = "0.3.0.0";
      };
      license = "MIT";
      copyright = "2018 Li-yao Xia";
      maintainer = "lysxia@gmail.com";
      author = "Li-yao Xia";
      homepage = "https://github.com/Lysxia/first-class-families#readme";
      url = "";
      synopsis = "First class type families";
      description = "First class type families,\neval-style defunctionalization\n\nSee \"Fcf\".";
      buildType = "Simple";
    };
    components = {
      "first-class-families" = {
        depends  = [ (hsPkgs.base) ];
      };
    };
  }