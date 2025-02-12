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
      identifier = { name = "preprocessor-tools"; version = "2.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jesse@eecs.northwestern.edu";
      author = "Jesse A. Tov <jesse@eecs.northwestern.edu>";
      homepage = "https://github.com/tov/preprocessor-tools-hs";
      url = "";
      synopsis = "A framework for extending Haskell's syntax via quick-and-dirty preprocessors";
      description = "This library provides a quick-and-dirty (but often effective)\nmethod for extending Haskell's syntax using a custom\npreprocessor.  It parses Haskell into a bare-bones AST with just\nenough knowledge of the syntax to preserve nesting, and then\nallows transformations on the AST.\n\nSee the package ixdopp\n(<http://hackage.haskell.org/cgi-bin/hackage-scripts/package/ixdopp>)\nfor an example of how to do this.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
        ];
        buildable = true;
      };
    };
  }