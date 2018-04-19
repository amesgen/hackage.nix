{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      smaller-base = true;
      syb-with-class = true;
      simple-generics = true;
      quasi-quotation = true;
    } // flags;
    in {
      package = {
        specVersion = "1.2";
        identifier = {
          name = "HStringTemplate";
          version = "0.5.1.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "s.clover@gmail.com";
        author = "Sterling Clover";
        homepage = "";
        url = "";
        synopsis = "StringTemplate implementation in Haskell.";
        description = "A port of the Java library by Terrence Parr.";
        buildType = "Simple";
      };
      components = {
        HStringTemplate = {
          depends  = (pkgs.lib.optional _flags.syb-with-class hsPkgs.syb-with-class ++ pkgs.lib.optionals _flags.quasi-quotation [
            hsPkgs.template-haskell
            hsPkgs.mtl
          ]) ++ (if _flags.smaller-base
            then [
              hsPkgs.syb
              hsPkgs.base
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.parsec
              hsPkgs.containers
              hsPkgs.pretty
              hsPkgs.time
              hsPkgs.old-time
              hsPkgs.old-locale
              hsPkgs.bytestring
              hsPkgs.directory
              hsPkgs.array
            ]
            else [
              hsPkgs.base
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.parsec
              hsPkgs.containers
              hsPkgs.pretty
              hsPkgs.time
              hsPkgs.old-time
              hsPkgs.old-locale
              hsPkgs.bytestring
              hsPkgs.directory
              hsPkgs.array
            ]);
        };
      };
    }