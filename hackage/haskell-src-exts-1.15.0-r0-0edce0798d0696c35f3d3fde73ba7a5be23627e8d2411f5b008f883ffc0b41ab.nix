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
      identifier = { name = "haskell-src-exts"; version = "1.15.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Niklas Broberg <niklas.broberg@chalmers.se>";
      author = "Niklas Broberg";
      homepage = "https://github.com/haskell-suite/haskell-src-exts";
      url = "";
      synopsis = "Manipulating Haskell source: abstract syntax, lexer, parser, and pretty-printer";
      description = "Haskell-Source with Extensions (HSE, haskell-src-exts)\nis an extension of the standard haskell-src package,\nand handles most registered syntactic extensions to Haskell, including:\n\n* Multi-parameter type classes with functional dependencies\n\n* Indexed type families (including associated types)\n\n* Empty data declarations\n\n* GADTs\n\n* Implicit parameters\n\n* Template Haskell\n\nand a few more. All extensions implemented in GHC are supported.\nApart from these standard extensions,\nit also handles regular patterns as per the HaRP extension\nas well as HSX-style embedded XML syntax.";
      buildType = "Custom";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."cpphs" or (errorHandler.buildDepError "cpphs"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.happy.components.exes.happy or (pkgs.pkgsBuildBuild.happy or (errorHandler.buildToolDepError "happy:happy")))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
            (hsPkgs."smallcheck" or (errorHandler.buildDepError "smallcheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-smallcheck" or (errorHandler.buildDepError "tasty-smallcheck"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
          buildable = true;
        };
      };
    };
  }