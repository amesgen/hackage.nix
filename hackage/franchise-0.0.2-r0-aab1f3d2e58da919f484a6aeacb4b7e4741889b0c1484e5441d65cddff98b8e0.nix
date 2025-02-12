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
      specVersion = "1.0";
      identifier = { name = "franchise"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "David Roundy";
      maintainer = "David Roundy <droundy@darcs.net>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "A package for configuring and building Haskell software";
      description = "Franchise is an easy-to use package for building Haskell\nsoftware.  Unlike Cabal, you aren't required to track every\npossible dependency in every possible build condition.  In\naddition, you are not required to use an external tool such as\nautoconf in order to configure the build based on which\npackages, libraries and tools are present.";
      buildType = "Custom";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
        ];
        buildable = true;
      };
    };
  }