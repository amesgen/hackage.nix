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
      identifier = { name = "mzv"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Tom Schrijvers, Bruno Oliveira";
      maintainer = "Ismael Figueroa <ifigueroap@gmail.com>";
      author = "Tom Schrijvers, Bruno Oliveira";
      homepage = "http://github.com/ifigueroap/mzv";
      url = "";
      synopsis = "Implementation of the \"Monads, Zippers and Views\" (Schrijvers and Oliveira, ICFP'11)";
      description = "Implementation of the \"Monads, Zippers and Views\" (Schrijvers and Oliveira, ICFP'11)";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
    };
  }