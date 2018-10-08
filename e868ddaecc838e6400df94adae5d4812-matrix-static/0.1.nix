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
        name = "matrix-static";
        version = "0.1";
      };
      license = "BSD-3-Clause";
      copyright = "2018, Wanja Chresta";
      maintainer = "wanja.hs@chrummibei.ch";
      author = "Wanja Chresta";
      homepage = "https://github.com/wchresta/matrix-static#readme";
      url = "";
      synopsis = "Wrapper around matrix that adds matrix sizes to the type-level";
      description = "Please see the README on GitHub at <https://github.com/wchresta/matrix-static#readme>";
      buildType = "Simple";
    };
    components = {
      "matrix-static" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.deepseq)
          (hsPkgs.ghc-typelits-knownnat)
          (hsPkgs.ghc-typelits-natnormalise)
          (hsPkgs.matrix)
          (hsPkgs.semigroups)
          (hsPkgs.vector)
        ];
      };
      tests = {
        "matrix-static-test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.deepseq)
            (hsPkgs.ghc-typelits-knownnat)
            (hsPkgs.ghc-typelits-natnormalise)
            (hsPkgs.matrix)
            (hsPkgs.matrix-static)
            (hsPkgs.semigroups)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
            (hsPkgs.vector)
          ];
        };
      };
    };
  }