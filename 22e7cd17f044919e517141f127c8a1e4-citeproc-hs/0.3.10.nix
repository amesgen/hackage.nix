{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      small_base = true;
      bibutils = true;
      network = true;
      hexpat = true;
      embed_data_files = false;
      unicode_collation = false;
    } // flags;
    in {
      package = {
        specVersion = "1.6";
        identifier = {
          name = "citeproc-hs";
          version = "0.3.10";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "andrea.rossato@unitn.it";
        author = "Andrea Rossato";
        homepage = "http://istitutocolli.org/repos/citeproc-hs/";
        url = "";
        synopsis = "A Citation Style Language implementation in Haskell";
        description = "citeproc-hs is a library for rendering\nbibliographic reference citations into a variety\nof styles using a macro language called Citation\nStyle Language (CSL). More details on CSL can be\nfound here:\n<http://citationstyles.org/>.\n\nFor the API documentation please see \"Text.CSL\".";
        buildType = "Simple";
      };
      components = {
        citeproc-hs = {
          depends  = ((((([
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.mtl
            hsPkgs.json
            hsPkgs.utf8-string
            hsPkgs.bytestring
            hsPkgs.filepath
            hsPkgs.pandoc-types
          ] ++ pkgs.lib.optional _flags.bibutils hsPkgs.hs-bibutils) ++ pkgs.lib.optionals _flags.network [
            hsPkgs.network
            hsPkgs.network-uri
            hsPkgs.HTTP
          ]) ++ (if _flags.hexpat
            then [ hsPkgs.hexpat ]
            else [
              hsPkgs.xml
            ])) ++ pkgs.lib.optionals _flags.embed_data_files [
            hsPkgs.template-haskell
            hsPkgs.file-embed
          ]) ++ pkgs.lib.optionals _flags.unicode_collation [
            hsPkgs.text
            hsPkgs.text-icu
          ]) ++ (if compiler.isGhc
            then [
              hsPkgs.base
              hsPkgs.syb
              hsPkgs.parsec
              hsPkgs.old-locale
              hsPkgs.time
            ]
            else [ hsPkgs.base ]);
        };
      };
    }