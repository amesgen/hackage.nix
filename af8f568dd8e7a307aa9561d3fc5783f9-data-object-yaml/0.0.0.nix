{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      buildtests = false;
      nolib = false;
    } // flags;
    in {
      package = {
        specVersion = "1.2";
        identifier = {
          name = "data-object-yaml";
          version = "0.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Snoyman <michael@snoyman.com>";
        author = "Michael Snoyman <michael@snoyman.com>";
        homepage = "http://github.com/snoyberg/yaml/tree/data-object-yaml";
        url = "";
        synopsis = "Support for serialising Haskell to and from Yaml.";
        description = "Binds to the libyaml library";
        buildType = "Simple";
      };
      components = {
        data-object-yaml = {
          depends  = [
            hsPkgs.base
            hsPkgs.data-object
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.convertible-text
            hsPkgs.attempt
          ];
        };
        exes = {
          runtests = {
            depends  = pkgs.lib.optionals _flags.buildtests [
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck
              hsPkgs.test-framework-hunit
              hsPkgs.HUnit
              hsPkgs.QuickCheck
            ];
          };
        };
      };
    }