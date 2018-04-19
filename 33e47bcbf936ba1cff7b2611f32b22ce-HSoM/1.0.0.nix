{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      package = {
        specVersion = "1.8";
        identifier = {
          name = "HSoM";
          version = "1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2008-2015 Paul Hudak and Donya Quick";
        maintainer = "Donya Quick <donyaquick@gmail.com>";
        author = "Paul Hudak <paul.hudak@yale.edu>,\nDonya Quick <donyaquick@gmail.com>,\nDan Winograd-Cort <daniel.winograd-cort@yale.edu>";
        homepage = "http://www.euterpea.com";
        url = "";
        synopsis = "Library for computer music education";
        description = "Supporting library for the Haskell School of Music textbook.";
        buildType = "Custom";
      };
      components = {
        HSoM = {
          depends  = [
            hsPkgs.base
            hsPkgs.arrows
            hsPkgs.array
            hsPkgs.deepseq
            hsPkgs.random
            hsPkgs.HCodecs
            hsPkgs.Euterpea
            hsPkgs.containers
            hsPkgs.markov-chain
            hsPkgs.pure-fft
            hsPkgs.UISF
          ] ++ pkgs.lib.optionals compiler.isGhc [
            hsPkgs.base
            hsPkgs.ghc-prim
          ];
        };
      };
    }