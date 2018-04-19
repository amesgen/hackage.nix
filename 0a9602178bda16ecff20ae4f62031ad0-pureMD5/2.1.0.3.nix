{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      test = false;
    } // flags;
    in {
      package = {
        specVersion = "1.6";
        identifier = {
          name = "pureMD5";
          version = "2.1.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Thomas DuBuisson";
        author = "Thomas DuBuisson <thomas.dubuisson@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "A Haskell-only implementation of the MD5 digest (hash) algorithm.";
        description = "A Haskell-only implementation of the MD5 digest (hash) algorithm.  This now supports\nthe crypto-api class interface.";
        buildType = "Simple";
      };
      components = {
        pureMD5 = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.binary
            hsPkgs.cereal
            hsPkgs.crypto-api
            hsPkgs.tagged
          ];
        };
        exes = {
          md5Test = {
            depends  = pkgs.lib.optionals _flags.test [
              hsPkgs.base
              hsPkgs.QuickCheck
              hsPkgs.crypto-api
              hsPkgs.bytestring
              hsPkgs.cereal
            ];
          };
        };
      };
    }