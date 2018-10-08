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
        name = "util-primitive-control";
        version = "0.1.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "2018 M Farkas-Dyck";
      maintainer = "strake888@gmail.com";
      author = "M Farkas-Dyck";
      homepage = "";
      url = "";
      synopsis = "Utilities for stateful primitive types and types based on them";
      description = "";
      buildType = "Simple";
    };
    components = {
      "util-primitive-control" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.control)
          (hsPkgs.primitive)
          (hsPkgs.util)
        ];
      };
      tests = {
        "test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.smallcheck)
            (hsPkgs.tasty)
            (hsPkgs.tasty-smallcheck)
            (hsPkgs.util-primitive-control)
          ];
        };
      };
    };
  }