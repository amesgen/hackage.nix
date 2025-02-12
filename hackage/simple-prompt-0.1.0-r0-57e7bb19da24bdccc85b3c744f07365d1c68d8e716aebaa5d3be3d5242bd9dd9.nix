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
      specVersion = "2.0";
      identifier = { name = "simple-prompt"; version = "0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2023  Jens Petersen <juhpetersen@gmail.com>";
      maintainer = "Jens Petersen <juhpetersen@gmail.com>";
      author = "Jens Petersen <juhpetersen@gmail.com>";
      homepage = "https://github.com/juhp/simple-prompt";
      url = "";
      synopsis = "Simple commandline text prompt functions";
      description = "The library provides prompt functions for reading user input:\nprompt returns the input given, prompt_ ignores the input,\nand yesno asks for confirmation.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
        ];
        buildable = true;
      };
    };
  }