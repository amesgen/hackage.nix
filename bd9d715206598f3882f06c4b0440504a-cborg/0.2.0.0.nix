{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      optimize-gmp = true;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "cborg";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2015-2017 Duncan Coutts,\n2015-2017 Well-Typed LLP,\n2015 IRIS Connect Ltd";
        maintainer = "duncan@community.haskell.org, ben@smart-cactus.org";
        author = "Duncan Coutts";
        homepage = "";
        url = "";
        synopsis = "Concise Binary Object Representation";
        description = "This package (formerly @binary-serialise-cbor@) provides an efficient\nimplementation of the Concise Binary Object Representation (CBOR), as\nspecified by [RFC 7049](https://tools.ietf.org/html/rfc7049).\n\nIf you are looking for a library for serialisation of Haskell values,\nhave a look at the [serialise](/package/serialise) package, which is\nbuilt upon this library.\n\nAn implementation of the standard bijection between CBOR and JSON is provided\nby the [cborg-json](/package/cborg-json) package. Also see [cbor-tool](/package/cbor-tool)\nfor a convenient command-line utility for working with CBOR data.";
        buildType = "Simple";
      };
      components = {
        cborg = {
          depends  = ([
            hsPkgs.array
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.ghc-prim
            hsPkgs.half
            hsPkgs.primitive
            hsPkgs.text
          ] ++ pkgs.lib.optional _flags.optimize-gmp hsPkgs.integer-gmp) ++ pkgs.lib.optionals (!compiler.isGhc) [
            hsPkgs.fail
            hsPkgs.semigroups
          ];
        };
      };
    }