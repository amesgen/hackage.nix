{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      use-template-haskell = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "rank2classes";
          version = "1.1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2017 Mario Blažević";
        maintainer = "Mario Blažević <blamario@protonmail.com>";
        author = "Mario Blažević";
        homepage = "https://github.com/blamario/grampa/tree/master/rank2classes";
        url = "";
        synopsis = "standard type constructor class hierarchy, only with methods of rank 2 types";
        description = "A mirror image of the standard type constructor class hierarchy rooted in 'Functor', except with methods of rank 2\ntypes and class instances of kind @(k->*)->*@. The classes enable generic handling of heterogenously typed data\nstructures and other neat tricks.";
        buildType = "Simple";
      };
      components = {
        rank2classes = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.distributive
          ] ++ pkgs.lib.optional _flags.use-template-haskell hsPkgs.template-haskell;
        };
        tests = {
          doctests = {
            depends  = [
              hsPkgs.base
              hsPkgs.rank2classes
              hsPkgs.doctest
            ];
          };
          TH = {
            depends  = [
              hsPkgs.base
              hsPkgs.rank2classes
              hsPkgs.distributive
              hsPkgs.tasty
              hsPkgs.tasty-hunit
            ];
          };
        };
      };
    }