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
      specVersion = "1.2";
      identifier = { name = "monad-parallel"; version = "0.5.2"; };
      license = "LicenseRef-GPL";
      copyright = "(c) 2010 Mario Blazevic";
      maintainer = "blamario@yahoo.com";
      author = "Mario Blazevic";
      homepage = "http://trac.haskell.org/SCC/wiki/monad-parallel";
      url = "";
      synopsis = "Parallel execution of monadic computations";
      description = "This package defines classes of monads that can perform multiple executions in parallel and combine their results. For\nany monad that's an instance of the class, the package re-implements a subset of the Control.Monad interface, but with\nparallel execution.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
    };
  }