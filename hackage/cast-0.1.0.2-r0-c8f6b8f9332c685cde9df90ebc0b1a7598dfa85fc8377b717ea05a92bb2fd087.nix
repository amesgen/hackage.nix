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
      identifier = { name = "cast"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2016 Bogdan Neterebskii";
      maintainer = "bog2dan1@gmail.com";
      author = "Bogdan Neterebskii";
      homepage = "https://github.com/haskell-patterns/cast#readme";
      url = "";
      synopsis = "Abstact cast pattern ";
      description = "Generalized pattern that allow cast one type for another.\nLook at README for example.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }