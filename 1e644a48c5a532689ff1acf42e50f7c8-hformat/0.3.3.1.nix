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
        name = "hformat";
        version = "0.3.3.1";
      };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "voidex@live.com";
      author = "Alexandr Ruchkin";
      homepage = "http://github.com/mvoidex/hformat";
      url = "";
      synopsis = "Simple Haskell formatting";
      description = "String formatting";
      buildType = "Simple";
    };
    components = {
      "hformat" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.base-unicode-symbols)
          (hsPkgs.ansi-terminal)
          (hsPkgs.text)
        ] ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "8.0")) (hsPkgs.semigroups);
      };
      tests = {
        "test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.base-unicode-symbols)
            (hsPkgs.text)
            (hsPkgs.hspec)
            (hsPkgs.hformat)
          ];
        };
      };
    };
  }