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
      specVersion = "3.0";
      identifier = { name = "deriving-trans"; version = "0.3.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "felixspringer149@gmail.com";
      author = "Felix Springer";
      homepage = "https://github.com/jumper149/deriving-trans";
      url = "";
      synopsis = "Derive instances for monad transformer stacks";
      description = "Implementing instances for monad transformer stacks can be tedious.\n<https://hackage.haskell.org/package/mtl mtl> defines each instance for each\ntransfomer, but this can be avoided.\n\n'Elevator' let's you access instances of the underlying monad of a transformer.\nComposing transformers with 'ComposeT' brings instances into scope during the\ninitialization of a transformer stack.\n\n'Elevator' can be used with DerivingVia to select a specific transformer to\nderive instances for a transformer stack.\n'ComposeT' composes transformers and accumulates instances in a transformer\nstack.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
        ];
        buildable = true;
      };
    };
  }