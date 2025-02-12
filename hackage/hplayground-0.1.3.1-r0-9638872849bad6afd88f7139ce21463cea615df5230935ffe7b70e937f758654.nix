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
    flags = { haste-inst = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "hplayground"; version = "0.1.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "agocorona@gmail.com";
      author = "Alberto Gomez Corona";
      homepage = "https://github.com/agocorona/hplayground";
      url = "";
      synopsis = "monadic, reactive Formlets running in the Web browser";
      description = "client-side haskell framework that compiles to javascript with the haste compiler. See homepage";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = if flags.haste-inst
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."monads-tf" or (errorHandler.buildDepError "monads-tf"))
            (hsPkgs."haste-lib" or (errorHandler.buildDepError "haste-lib"))
            (hsPkgs."haste-perch" or (errorHandler.buildDepError "haste-perch"))
          ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."monads-tf" or (errorHandler.buildDepError "monads-tf"))
            (hsPkgs."haste-compiler" or (errorHandler.buildDepError "haste-compiler"))
            (hsPkgs."haste-perch" or (errorHandler.buildDepError "haste-perch"))
          ];
        buildable = true;
      };
    };
  }