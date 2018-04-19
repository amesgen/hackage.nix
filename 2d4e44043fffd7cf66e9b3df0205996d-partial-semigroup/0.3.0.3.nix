{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      semigroup-in-base = true;
      identity-in-base = true;
      generics-in-base = true;
      enable-hedgehog = true;
      enable-doctest = true;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "partial-semigroup";
          version = "0.3.0.3";
        };
        license = "Apache-2.0";
        copyright = "";
        maintainer = "Chris Martin <ch.martin@gmail.com>";
        author = "Chris Martin <ch.martin@gmail.com>";
        homepage = "https://github.com/chris-martin/partial-semigroup";
        url = "";
        synopsis = "A partial binary associative operator";
        description = "A partial semigroup is like a semigroup, but the operator is partial. We\nrepresent this in Haskell as a total function @(<>?) :: a -> a -> Maybe a@.";
        buildType = "Simple";
      };
      components = {
        partial-semigroup = {
          depends  = (([
            hsPkgs.base
          ] ++ pkgs.lib.optional _flags.generics-in-base hsPkgs.base) ++ pkgs.lib.optional _flags.identity-in-base hsPkgs.base) ++ (if _flags.semigroup-in-base
            then [ hsPkgs.base ]
            else [ hsPkgs.semigroups ]);
        };
        tests = {
          docs = {
            depends  = [
              hsPkgs.base
            ] ++ pkgs.lib.optional _flags.enable-doctest hsPkgs.doctest;
          };
          examples = {
            depends  = ([
              hsPkgs.base
              hsPkgs.partial-semigroup
            ] ++ pkgs.lib.optional _flags.enable-hedgehog hsPkgs.hedgehog) ++ (if _flags.semigroup-in-base
              then [ hsPkgs.base ]
              else [ hsPkgs.semigroups ]);
          };
          properties = {
            depends  = ([
              hsPkgs.base
              hsPkgs.partial-semigroup
            ] ++ pkgs.lib.optional _flags.enable-hedgehog hsPkgs.hedgehog) ++ (if _flags.semigroup-in-base
              then [ hsPkgs.base ]
              else [ hsPkgs.semigroups ]);
          };
          generics = {
            depends  = [
              hsPkgs.base
              hsPkgs.partial-semigroup
            ] ++ pkgs.lib.optionals _flags.generics-in-base (pkgs.lib.optionals _flags.enable-hedgehog [
              hsPkgs.base
              hsPkgs.hedgehog
            ] ++ (if _flags.semigroup-in-base
              then [ hsPkgs.base ]
              else [ hsPkgs.semigroups ]));
          };
        };
      };
    }