{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      test-properties = true;
      test-hlint = true;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ed25519";
          version = "0.0.3.0";
        };
        license = "MIT";
        copyright = "Copyright (c) Austin Seipp 2013-2015";
        maintainer = "Austin Seipp <aseipp@pobox.com>";
        author = "Austin Seipp";
        homepage = "http://thoughtpolice.github.com/hs-ed25519";
        url = "";
        synopsis = "ed25519 cryptographic signatures";
        description = "This package provides a simple, portable implementation of the\ned25519 public-key signature system. It also includes support for\ndetached signatures.\n\nThe underlying implementation uses the @ref10@ implementation of\ned25519 from SUPERCOP, and should be relatively fast.\n\nFor more information (including how to get a copy of the software)\nvisit <http://ed25519.cr.yp.to>.";
        buildType = "Simple";
      };
      components = {
        ed25519 = {
          depends  = [
            hsPkgs.ghc-prim
            hsPkgs.base
            hsPkgs.bytestring
          ];
        };
        tests = {
          properties = {
            depends  = pkgs.lib.optionals (!(!_flags.test-properties)) [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.QuickCheck
              hsPkgs.ed25519
            ];
          };
          hlint = {
            depends  = pkgs.lib.optionals (!(!_flags.test-hlint)) [
              hsPkgs.base
              hsPkgs.hlint
            ];
          };
        };
        benchmarks = {
          bench1 = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.ed25519
            ];
          };
        };
      };
    }