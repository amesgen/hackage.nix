{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      template-haskell = true;
      herbie = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "linear";
          version = "1.20.8";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2012-2015 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/linear/";
        url = "";
        synopsis = "Linear Algebra";
        description = "Types and combinators for linear algebra on free vector spaces";
        buildType = "Custom";
      };
      components = {
        linear = {
          depends  = ([
            hsPkgs.adjunctions
            hsPkgs.base
            hsPkgs.base-orphans
            hsPkgs.binary
            hsPkgs.bytes
            hsPkgs.cereal
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.distributive
            hsPkgs.ghc-prim
            hsPkgs.hashable
            hsPkgs.lens
            hsPkgs.reflection
            hsPkgs.semigroups
            hsPkgs.semigroupoids
            hsPkgs.tagged
            hsPkgs.transformers
            hsPkgs.transformers-compat
            hsPkgs.unordered-containers
            hsPkgs.vector
            hsPkgs.void
          ] ++ pkgs.lib.optional (_flags.template-haskell && (compiler.isGhc && true)) hsPkgs.template-haskell) ++ pkgs.lib.optional _flags.herbie hsPkgs.HerbiePlugin;
        };
        tests = {
          doctests = {
            depends  = [
              hsPkgs.base
              hsPkgs.doctest
              hsPkgs.lens
              hsPkgs.linear
              hsPkgs.simple-reflect
            ];
          };
          UnitTests = {
            depends  = [
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.deepseq
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.HUnit
              hsPkgs.linear
              hsPkgs.reflection
              hsPkgs.vector
            ];
          };
        };
      };
    }