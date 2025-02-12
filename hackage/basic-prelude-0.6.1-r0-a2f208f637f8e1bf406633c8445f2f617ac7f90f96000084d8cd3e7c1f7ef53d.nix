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
      specVersion = "1.8";
      identifier = { name = "basic-prelude"; version = "0.6.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman, Dan Burton";
      homepage = "https://github.com/snoyberg/basic-prelude";
      url = "";
      synopsis = "An enhanced core prelude; a common foundation for alternate preludes.";
      description = "The premise of @basic-prelude@ is that there are a lot of very commonly desired features missing from the standard @Prelude@, such as commonly used operators (@\\<$\\>@ and @>=>@, for instance) and imports for common datatypes (e.g., @ByteString@ and @Vector@). At the same time, there are lots of other components which are more debatable, such as providing polymorphic versions of common functions.\n\nSo @basic-prelude@ is intended to give a common foundation for a number of alternate preludes. The package provides two modules: @CorePrelude@ provides the common ground for other preludes to build on top of, while @BasicPrelude@ exports @CorePrelude@ together with commonly used list functions to provide a drop-in replacement for the standard @Prelude@.\n\nUsers wishing to have an improved @Prelude@ can use @BasicPrelude@. Developers wishing to create a new prelude should use @CorePrelude@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."ReadArgs" or (errorHandler.buildDepError "ReadArgs"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
        ];
        buildable = true;
      };
    };
  }