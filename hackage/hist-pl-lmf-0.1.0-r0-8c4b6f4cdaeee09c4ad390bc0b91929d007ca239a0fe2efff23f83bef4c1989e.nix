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
      identifier = { name = "hist-pl-lmf"; version = "0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2012 IPI PAN";
      maintainer = "waszczuk.kuba@gmail.com";
      author = "Jakub Waszczuk";
      homepage = "https://github.com/kawu/hist-pl/tree/master/lmf";
      url = "";
      synopsis = "LMF parsing for the historical dictionary of Polish";
      description = "The library provides a Lexical Markup Framework (LMF) parsing\nutilities which allow to translate the original LMF representation\nof the historical dictionary of Polish to data structures defined\nin the hist-pl-types library.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."polysoup" or (errorHandler.buildDepError "polysoup"))
          (hsPkgs."hist-pl-types" or (errorHandler.buildDepError "hist-pl-types"))
        ];
        buildable = true;
      };
    };
  }