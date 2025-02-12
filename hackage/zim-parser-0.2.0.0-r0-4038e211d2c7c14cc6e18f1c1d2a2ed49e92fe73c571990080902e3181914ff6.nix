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
      specVersion = "1.10";
      identifier = { name = "zim-parser"; version = "0.2.0.0"; };
      license = "GPL-3.0-only";
      copyright = "Copyright (c) 2015 Robbin C.";
      maintainer = "Robbin C. <robbinch33@gmail.com>";
      author = "Robbin C. <robbinch33@gmail.com>";
      homepage = "https://github.com/robbinch/zim-parser#readme";
      url = "";
      synopsis = "Read and parse ZIM files";
      description = "zim-parser is a library to read and parse ZIM (http://openzim.org) files.\nZiM files contain offline web content (eg. Wikipedia) which can be browsed\nlocally without an Internet connection.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."binary-conduit" or (errorHandler.buildDepError "binary-conduit"))
          (hsPkgs."lzma-conduit" or (errorHandler.buildDepError "lzma-conduit"))
        ];
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."binary-conduit" or (errorHandler.buildDepError "binary-conduit"))
            (hsPkgs."lzma-conduit" or (errorHandler.buildDepError "lzma-conduit"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }