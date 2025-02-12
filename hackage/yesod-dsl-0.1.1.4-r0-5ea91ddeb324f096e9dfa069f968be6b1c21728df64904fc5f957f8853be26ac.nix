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
      identifier = { name = "yesod-dsl"; version = "0.1.1.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Tero Laitinen";
      author = "Tero Laitinen ";
      homepage = "https://github.com/tlaitinen/yesod-dsl";
      url = "";
      synopsis = "DSL for generating Yesod subsite to manage an RDBMS;";
      description = "A domain specific language and a code generator desined to create RESTful services for managing an RDBMS with Yesod web framework and Persistent.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "yesod-dsl" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."shakespeare-text" or (errorHandler.buildDepError "shakespeare-text"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."MissingH" or (errorHandler.buildDepError "MissingH"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.alex.components.exes.alex or (pkgs.pkgsBuildBuild.alex or (errorHandler.buildToolDepError "alex:alex")))
            (hsPkgs.pkgsBuildBuild.happy.components.exes.happy or (pkgs.pkgsBuildBuild.happy or (errorHandler.buildToolDepError "happy:happy")))
          ];
          buildable = true;
        };
      };
    };
  }