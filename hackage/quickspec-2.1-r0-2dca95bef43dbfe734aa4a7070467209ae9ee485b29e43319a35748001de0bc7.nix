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
      specVersion = "1.6";
      identifier = { name = "quickspec"; version = "2.1"; };
      license = "BSD-3-Clause";
      copyright = "2009-2018 Nick Smallbone";
      maintainer = "nicsma@chalmers.se";
      author = "Nick Smallbone";
      homepage = "https://github.com/nick8325/quickspec";
      url = "";
      synopsis = "Equational laws for free!";
      description = "QuickSpec takes your Haskell code and, as if by magic, discovers laws\nabout it. You give QuickSpec a collection of Haskell functions;\nQuickSpec tests your functions with QuickCheck and prints out laws which\nseem to hold.\n\nFor example, give QuickSpec the functions @reverse@, @++@ and @[]@, and\nit will find six laws:\n\n> reverse [] == []\n> xs ++ [] == xs\n> [] ++ xs == xs\n> reverse (reverse xs) == xs\n> (xs ++ ys) ++ zs == xs ++ (ys ++ zs)\n> reverse xs ++ reverse ys == reverse (ys ++ xs)\n\nQuickSpec can find equational laws as well as conditional equations. All\nyou need to supply are the functions to test, as well as @Ord@ and\n@Arbitrary@ instances for QuickSpec to use in testing; the rest is\nautomatic.\n\nFor information on how to use QuickSpec, see the documentation in the main\nmodule, \"QuickSpec\". You can also look in the\n@<https://github.com/nick8325/quickspec/tree/master/examples examples>@\ndirectory, for example at\n@<https://github.com/nick8325/quickspec/tree/master/examples/Lists.hs Lists.hs>@,\n@<https://github.com/nick8325/quickspec/tree/master/examples/IntSet.hs IntSet.hs>@, or\n@<https://github.com/nick8325/quickspec/tree/master/examples/Parsing.hs Parsing.hs>@.\nTo read about how\nQuickSpec works, see our paper,\n<http://www.cse.chalmers.se/~nicsma/papers/quickspec2.pdf Quick specifications for the busy programmer>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."constraints" or (errorHandler.buildDepError "constraints"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-lens-light" or (errorHandler.buildDepError "data-lens-light"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."spoon" or (errorHandler.buildDepError "spoon"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."twee-lib" or (errorHandler.buildDepError "twee-lib"))
          (hsPkgs."uglymemo" or (errorHandler.buildDepError "uglymemo"))
        ];
        buildable = true;
      };
    };
  }