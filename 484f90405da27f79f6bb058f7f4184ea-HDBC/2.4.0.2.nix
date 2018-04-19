{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
      buildtests = false;
      mintime15 = true;
    } // flags;
    in {
      package = {
        specVersion = "1.8";
        identifier = {
          name = "HDBC";
          version = "2.4.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2005-2011 John Goerzen";
        maintainer = "Nicolas Wu <nicolas.wu@gmail.com>";
        author = "John Goerzen, Nicolas Wu";
        homepage = "https://github.com/hdbc/hdbc";
        url = "";
        synopsis = "Haskell Database Connectivity";
        description = "HDBC provides an abstraction layer between Haskell programs and SQL\nrelational databases. This lets you write database code once, in\nHaskell, and have it work with any number of backend SQL databases\n(MySQL, Oracle, PostgreSQL, ODBC-compliant databases, etc.)";
        buildType = "Simple";
      };
      components = {
        HDBC = {
          depends  = ([
            hsPkgs.mtl
            hsPkgs.convertible
            hsPkgs.text
            hsPkgs.utf8-string
          ] ++ (if _flags.splitbase
            then [
              hsPkgs.base
              hsPkgs.old-time
              hsPkgs.bytestring
              hsPkgs.containers
            ] ++ (if _flags.mintime15
              then [ hsPkgs.time ]
              else [
                hsPkgs.time
                hsPkgs.old-locale
              ])
            else [
              hsPkgs.base
            ])) ++ pkgs.lib.optional compiler.isGhc hsPkgs.base;
        };
        exes = {
          runtests = {
            depends  = pkgs.lib.optionals _flags.buildtests (([
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.testpack
              hsPkgs.mtl
              hsPkgs.convertible
              hsPkgs.utf8-string
              hsPkgs.text
            ] ++ (if _flags.splitbase
              then [
                hsPkgs.base
                hsPkgs.old-time
                hsPkgs.bytestring
                hsPkgs.containers
              ] ++ (if _flags.mintime15
                then [ hsPkgs.time ]
                else [
                  hsPkgs.time
                  hsPkgs.old-locale
                ])
              else [
                hsPkgs.base
              ])) ++ pkgs.lib.optional compiler.isGhc hsPkgs.base);
          };
        };
      };
    }