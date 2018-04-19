{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      package = {
        specVersion = "1.2";
        identifier = {
          name = "Interpolation";
          version = "0.1";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "aleator@gmail.com";
        author = "Ville Tirronen";
        homepage = "";
        url = "";
        synopsis = "Multiline strings, interpolation and templating.";
        description = "This package adds quasiquoter for multiline\nstrings, interpolation and simple templating.\nHandy for text generation.";
        buildType = "Simple";
      };
      components = {
        Interpolation = {
          depends  = [
            hsPkgs.base
            hsPkgs.syb
            hsPkgs.template-haskell
          ];
        };
      };
    }