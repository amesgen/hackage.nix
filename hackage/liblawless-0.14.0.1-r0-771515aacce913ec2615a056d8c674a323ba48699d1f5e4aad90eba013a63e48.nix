{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.24";
      identifier = { name = "liblawless"; version = "0.14.0.1"; };
      license = "GPL-3.0-only";
      copyright = "© 2016 Evan Cofsky";
      maintainer = "evan@theunixman.com";
      author = "Evan Cofsky";
      homepage = "";
      url = "";
      synopsis = "Prelude based on protolude for GHC 8 and beyond.";
      description = "A Prelude relpacement for GHC 8 with a focus on building\napplications with Lenses, Machines, and Applicatives.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (errorHandler.buildDepError "base-unicode-symbols"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."boomerang" or (errorHandler.buildDepError "boomerang"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."containers-unicode-symbols" or (errorHandler.buildDepError "containers-unicode-symbols"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."data-textual" or (errorHandler.buildDepError "data-textual"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."dns" or (errorHandler.buildDepError "dns"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hjsonschema" or (errorHandler.buildDepError "hjsonschema"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."machines" or (errorHandler.buildDepError "machines"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-ip" or (errorHandler.buildDepError "network-ip"))
          (hsPkgs."parsers" or (errorHandler.buildDepError "parsers"))
          (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."stm-containers" or (errorHandler.buildDepError "stm-containers"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-icu" or (errorHandler.buildDepError "text-icu"))
          (hsPkgs."text-icu-normalized" or (errorHandler.buildDepError "text-icu-normalized"))
          (hsPkgs."text-printer" or (errorHandler.buildDepError "text-printer"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          (hsPkgs."zippers" or (errorHandler.buildDepError "zippers"))
        ];
        buildable = true;
      };
      exes = {
        "ZFS" = {
          depends = [
            (hsPkgs."liblawless" or (errorHandler.buildDepError "liblawless"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test-liblawless" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."dns" or (errorHandler.buildDepError "dns"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."liblawless" or (errorHandler.buildDepError "liblawless"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (errorHandler.buildDepError "test-framework-th"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }