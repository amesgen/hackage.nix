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
      specVersion = "2.4";
      identifier = { name = "hls-fourmolu-plugin"; version = "2.4.0.0"; };
      license = "Apache-2.0";
      copyright = "The Haskell IDE Team";
      maintainer = "alan.zimm@gmail.com";
      author = "The Haskell IDE Team";
      homepage = "https://github.com/haskell/haskell-language-server";
      url = "";
      synopsis = "Integration with the Fourmolu code formatter";
      description = "Please see the README on GitHub at <https://github.com/haskell/haskell-language-server#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
          (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
          (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ] ++ (if compiler.isGhc && compiler.version.ge "9.0" && (compiler.isGhc && compiler.version.lt "9.2")
          then [
            (hsPkgs."fourmolu" or (errorHandler.buildDepError "fourmolu"))
          ]
          else pkgs.lib.optional (compiler.isGhc && compiler.version.ge "9.2" && (compiler.isGhc && compiler.version.lt "9.8")) (hsPkgs."fourmolu" or (errorHandler.buildDepError "fourmolu")))) ++ pkgs.lib.optional (compiler.isGhc && compiler.version.ge "9.2" && system.isWindows && (compiler.isGhc && compiler.version.lt "9.4")) (hsPkgs."fourmolu" or (errorHandler.buildDepError "fourmolu"));
        buildable = (if compiler.isGhc && compiler.version.ge "9.8"
          then false
          else true) && (if compiler.isGhc && compiler.version.ge "9.0" && (compiler.isGhc && compiler.version.lt "9.2")
          then true
          else if compiler.isGhc && compiler.version.ge "9.2" && (compiler.isGhc && compiler.version.lt "9.8")
            then true
            else false);
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hls-fourmolu-plugin" or (errorHandler.buildDepError "hls-fourmolu-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.fourmolu.components.exes.fourmolu or (pkgs.pkgsBuildBuild.fourmolu or (errorHandler.buildToolDepError "fourmolu:fourmolu")))
          ];
          buildable = if compiler.isGhc && compiler.version.ge "9.8"
            then false
            else true;
        };
      };
    };
  }