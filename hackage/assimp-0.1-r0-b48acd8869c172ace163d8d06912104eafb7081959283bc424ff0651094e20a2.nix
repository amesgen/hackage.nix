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
      identifier = { name = "assimp"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Joel Burget 2011";
      maintainer = "joelburget@gmail.com";
      author = "Joel Burget";
      homepage = "";
      url = "";
      synopsis = "The Assimp asset import library";
      description = "Important: Install with\n@cabal install --extra-include-dirs \\/usr\\/local\\/include\\/assimp\\/@\nOf course use the location of the include files on your system.\n\nThis library provides FFI bindings to the Assimp asset import\nlibrary. It requires Assimp to already be installed. For more\ninformation about Assimp see the assimp website at\n<http://assimp.sourceforge.net/>.\n\nThis release corresponds to Assimp 2.0. When this package stabilizes I\nintend to track new releases of Assimp by also releasing new versions with\nthe same version number, but this should be considered a beta release.\nImporting models is currently working. Textures and animations are\nuntested.\n\nHere is a sample program that imports a scene and then outputs the\ninformation contained in it.\n\n> module Main where\n>\n> import System (getArgs)\n> import Graphics.Formats.Assimp\n>\n> -- Defines the preprocessing we want assimp to perform\n> processing = [ CalcTangentSpace\n>              , Triangulate\n>              , JoinIdenticalVertices\n>              , SortByPType\n>              ]\n>\n> main = do\n>   args <- getArgs\n>   scene <- importFile (head args) processing\n>   print scene                   -- Outputs all information in the scene\n>   getVersionMajor >>= print     -- Print the major version of assimp\n>   getVersionMinor >>= print     -- Print the minor version of assimp\n>   getVersionRevision >>= print  -- Print the version revision of assimp\n\nSee <https://github.com/joelburget/Cologne/blob/master/Cologne/AssimpImport.hs>\nfor more.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          (hsPkgs."vect" or (errorHandler.buildDepError "vect"))
        ];
        libs = [ (pkgs."assimp" or (errorHandler.sysDepError "assimp")) ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.c2hs.components.exes.c2hs or (pkgs.pkgsBuildBuild.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
    };
  }