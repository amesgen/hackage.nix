{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "potoki-core";
          version = "2.1.0.1";
        };
        license = "MIT";
        copyright = "(c) 2017, Metrix.AI";
        maintainer = "Metrix.AI Ninjas <ninjas@metrix.ai>";
        author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
        homepage = "https://github.com/metrix-ai/potoki-core";
        url = "";
        synopsis = "Low-level components of \"potoki\"";
        description = "Provides everything required for building custom instances of\nthe \\\"potoki\\\" abstractions.\nConsider this library to be the Internals modules of \\\"potoki\\\".";
        buildType = "Simple";
      };
      components = {
        potoki-core = {
          depends  = [
            hsPkgs.acquire
            hsPkgs.base
            hsPkgs.profunctors
            hsPkgs.stm
            hsPkgs.attoparsec
            hsPkgs.bytestring
            hsPkgs.directory
            hsPkgs.foldl
            hsPkgs.hashable
            hsPkgs.ptr
            hsPkgs.text
            hsPkgs.transformers
            hsPkgs.unagi-chan
            hsPkgs.unordered-containers
            hsPkgs.vector
          ];
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.potoki-core
              hsPkgs.attoparsec
              hsPkgs.acquire
              hsPkgs.tasty
              hsPkgs.tasty-quickcheck
              hsPkgs.tasty-hunit
              hsPkgs.quickcheck-instances
              hsPkgs.QuickCheck
              hsPkgs.random
              hsPkgs.foldl
              hsPkgs.ilist
              hsPkgs.rerebase
            ];
          };
        };
      };
    }