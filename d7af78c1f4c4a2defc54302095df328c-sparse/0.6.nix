{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      test-properties = true;
      test-doctests = true;
      optimize = false;
      llvm = false;
    } // flags;
    in {
      package = {
        specVersion = "1.8";
        identifier = {
          name = "sparse";
          version = "0.6";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2013 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/sparse";
        url = "";
        synopsis = "A playground of sparse linear algebra primitives using Morton ordering";
        description = "A playground of sparse linear algebra primitives using Morton ordering\n\nThe design of this library is describe in the following articles on FP Complete's School of Haskell.\n\n1. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-1>\n\n2. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-2>\n\n3. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-3>\n\n4. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-4>\n\n5. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-5>";
        buildType = "Custom";
      };
      components = {
        sparse = {
          depends  = [
            hsPkgs.base
            hsPkgs.contravariant
            hsPkgs.deepseq
            hsPkgs.hybrid-vectors
            hsPkgs.lens
            hsPkgs.primitive
            hsPkgs.transformers
            hsPkgs.vector
            hsPkgs.vector-algorithms
          ];
        };
        tests = {
          properties = {
            depends  = pkgs.lib.optionals (!(!_flags.test-properties)) [
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.hybrid-vectors
              hsPkgs.lens
              hsPkgs.linear
              hsPkgs.QuickCheck
              hsPkgs.sparse
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
              hsPkgs.test-framework-th
              hsPkgs.transformers
              hsPkgs.vector
            ];
          };
          doctests = {
            depends  = pkgs.lib.optionals (!(!_flags.test-doctests)) [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.deepseq
              hsPkgs.doctest
              hsPkgs.filepath
              hsPkgs.mtl
              hsPkgs.semigroups
              hsPkgs.simple-reflect
            ];
          };
        };
        benchmarks = {
          mm = {
            depends  = [
              hsPkgs.array
              hsPkgs.base
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.sparse
              hsPkgs.vector
            ];
          };
        };
      };
    }