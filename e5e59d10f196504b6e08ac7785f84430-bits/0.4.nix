{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      test-doctests = true;
      lib-werror = false;
    } // flags;
    in {
      package = {
        specVersion = "1.8";
        identifier = {
          name = "bits";
          version = "0.4";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2013 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/analytics/bits";
        url = "";
        synopsis = "Various bit twiddling and bitwise serialization primitives";
        description = "Various bit twiddling and bitwise serialization primitives";
        buildType = "Custom";
      };
      components = {
        bits = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytes
            hsPkgs.mtl
            hsPkgs.transformers
          ];
        };
        tests = {
          doctests = {
            depends  = pkgs.lib.optionals (!(!_flags.test-doctests)) [
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.doctest
              hsPkgs.filepath
            ];
          };
        };
      };
    }