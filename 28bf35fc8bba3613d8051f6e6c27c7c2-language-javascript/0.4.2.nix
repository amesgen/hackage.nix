{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      buildtests = false;
    } // flags;
    in {
      package = {
        specVersion = "1.6";
        identifier = {
          name = "language-javascript";
          version = "0.4.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010 Alan Zimmerman";
        maintainer = "alan.zimm@gmail.com";
        author = "Alan Zimmerman";
        homepage = "http://github.com/alanz/language-javascript";
        url = "";
        synopsis = "Parser for JavaScript";
        description = "Parses Javascript into an Abstract Syntax Tree (AST).  Initially intended as frontend to hjsmin.";
        buildType = "Simple";
      };
      components = {
        language-javascript = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.mtl
            hsPkgs.containers
            hsPkgs.utf8-light
          ];
        };
        exes = {
          runtests = {
            depends  = pkgs.lib.optionals _flags.buildtests [
              hsPkgs.QuickCheck
              hsPkgs.HUnit
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework
            ];
          };
        };
      };
    }