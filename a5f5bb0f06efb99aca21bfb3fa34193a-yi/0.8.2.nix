{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      pango = false;
      vty = true;
      scion = false;
      ghcapi = false;
      profiling = false;
      testing = true;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yi";
          version = "0.8.2";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "yi-devel@googlegroups.com";
        author = "AUTHORS";
        homepage = "http://haskell.org/haskellwiki/Yi";
        url = "";
        synopsis = "The Haskell-Scriptable Editor";
        description = "Yi is a text editor written in Haskell and extensible in Haskell. The goal of the Yi project is\nto provide a flexible, powerful, and correct editor for haskell hacking.";
        buildType = "Simple";
      };
      components = {
        yi = {
          depends  = (((((([
            hsPkgs.Cabal
            hsPkgs.Diff
            hsPkgs.array
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.process
            hsPkgs.old-locale
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.cautious-file
            hsPkgs.concrete-typerep
            hsPkgs.derive
            hsPkgs.data-default
            hsPkgs.lens
            hsPkgs.dlist
            hsPkgs.dyre
            hsPkgs.filepath
            hsPkgs.fingertree
            hsPkgs.hashable
            hsPkgs.hint
            hsPkgs.mtl
            hsPkgs.parsec
            hsPkgs.pointedlist
            hsPkgs.regex-base
            hsPkgs.regex-tdfa
            hsPkgs.safe
            hsPkgs.split
            hsPkgs.template-haskell
            hsPkgs.text
            hsPkgs.time
            hsPkgs.utf8-string
            hsPkgs.uniplate
            hsPkgs.unix-compat
            hsPkgs.unordered-containers
            hsPkgs.xdg-basedir
            hsPkgs.ghc
            hsPkgs.transformers-base
          ] ++ pkgs.lib.optional (!system.isWindows) hsPkgs.unix) ++ pkgs.lib.optional system.isWindows hsPkgs.Win32) ++ pkgs.lib.optionals _flags.testing [
            hsPkgs.QuickCheck
            hsPkgs.random
          ]) ++ pkgs.lib.optionals _flags.pango [
            hsPkgs.gtk
            hsPkgs.glib
            hsPkgs.pango
          ]) ++ pkgs.lib.optionals _flags.vty [
            hsPkgs.unix-compat
            hsPkgs.vty
          ]) ++ pkgs.lib.optionals _flags.scion [
            hsPkgs.scion
            hsPkgs.ghc-syb-utils
          ]) ++ pkgs.lib.optionals _flags.ghcapi [
            hsPkgs.ghc-paths
            hsPkgs.old-time
            hsPkgs.rosezipper
            hsPkgs.pureMD5
            hsPkgs.ghc-paths
          ];
        };
        exes = {
          parserTest = {
            depends  = [
              hsPkgs.base
              hsPkgs.array
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.yi
            ];
          };
          yi = {
            depends  = [
              hsPkgs.base
              hsPkgs.yi
            ];
          };
        };
        tests = {
          test-suite = {
            depends  = [
              hsPkgs.base
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.tasty-quickcheck
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.yi
            ];
          };
        };
      };
    }