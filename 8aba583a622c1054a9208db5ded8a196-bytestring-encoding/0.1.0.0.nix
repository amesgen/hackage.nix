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
        name = "bytestring-encoding";
        version = "0.1.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "2018 Masahiro Sakai";
      maintainer = "masahiro.sakai@gmail.com";
      author = "Masahiro Sakai";
      homepage = "https://github.com/msakai/bytestring-encoding#readme";
      url = "";
      synopsis = "ByteString ↔ Text converter based on GHC.IO.Encoding";
      description = "Please see the README on GitHub at <https://github.com/msakai/bytestring-encoding#readme>";
      buildType = "Simple";
    };
    components = {
      "bytestring-encoding" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.text)
        ];
      };
      tests = {
        "bytestring-encoding-test" = {
          depends  = [
            (hsPkgs.QuickCheck)
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.bytestring-encoding)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
            (hsPkgs.tasty-quickcheck)
            (hsPkgs.tasty-th)
            (hsPkgs.text)
          ];
        };
      };
    };
  }