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
      specVersion = "1.8";
      identifier = { name = "som"; version = "8.0.5"; };
      license = "BSD-3-Clause";
      copyright = "(c) Amy de Buitléir 2010-2015";
      maintainer = "amy@nualeargais.ie";
      author = "Amy de Buitléir";
      homepage = "https://github.com/mhwombat/som";
      url = "";
      synopsis = "Self-Organising Maps.";
      description = "A Kohonen Self-organising Map (SOM) maps input patterns\nonto a regular grid (usually two-dimensional) where each\nnode in the grid is a model of the input data, and does\nso using a method which ensures that any topological\nrelationships within the input data are also represented\nin the grid. This implementation supports the use of\nnon-numeric patterns.\n\nIn layman's terms, a SOM can be useful when you you want\nto discover the underlying structure of some data.\n\nThe userguide is available at\n<https://github.com/mhwombat/som/wiki>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."grid" or (errorHandler.buildDepError "grid"))
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
        ];
        buildable = true;
      };
      tests = {
        "som-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."som" or (errorHandler.buildDepError "som"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."grid" or (errorHandler.buildDepError "grid"))
            (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
          buildable = true;
        };
      };
    };
  }