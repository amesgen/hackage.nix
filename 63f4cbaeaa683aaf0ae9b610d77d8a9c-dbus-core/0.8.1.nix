{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      test = false;
      hpc = false;
    } // flags;
    in {
      package = {
        specVersion = "1.6";
        identifier = {
          name = "dbus-core";
          version = "0.8.1";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "jmillikin@gmail.com";
        author = "John Millikin";
        homepage = "http://ianen.org/haskell/dbus/";
        url = "";
        synopsis = "Low-level D-Bus protocol implementation";
        description = "";
        buildType = "Simple";
      };
      components = {
        dbus-core = {
          depends  = [
            hsPkgs.base
            hsPkgs.parsec
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.data-binary-ieee754
            hsPkgs.HaXml
            hsPkgs.pretty
            hsPkgs.text
            hsPkgs.mtl
            hsPkgs.containers
            hsPkgs.unix
            hsPkgs.network
          ];
        };
        exes = {
          dbus-core-tests = {
            depends  = pkgs.lib.optionals _flags.test [
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }