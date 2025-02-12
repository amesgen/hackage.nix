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
      specVersion = "1.24";
      identifier = { name = "gi-handy"; version = "0.0.7"; };
      license = "LGPL-2.1-only";
      copyright = "";
      maintainer = "Iñaki García Etxebarria";
      author = "Will Thompson, Iñaki García Etxebarria and Jonas Platte";
      homepage = "https://github.com/haskell-gi/haskell-gi";
      url = "";
      synopsis = "libhandy bindings";
      description = "Bindings for libhandy, autogenerated by haskell-gi.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.pkgsBuildBuild.haskell-gi or (pkgs.pkgsBuildBuild.haskell-gi or (errorHandler.setupDepError "haskell-gi")))
        (hsPkgs.pkgsBuildBuild.gi-gtk or (pkgs.pkgsBuildBuild.gi-gtk or (errorHandler.setupDepError "gi-gtk")))
        (hsPkgs.pkgsBuildBuild.gi-gdk or (pkgs.pkgsBuildBuild.gi-gdk or (errorHandler.setupDepError "gi-gdk")))
        (hsPkgs.pkgsBuildBuild.gi-atk or (pkgs.pkgsBuildBuild.gi-atk or (errorHandler.setupDepError "gi-atk")))
        (hsPkgs.pkgsBuildBuild.gi-gobject or (pkgs.pkgsBuildBuild.gi-gobject or (errorHandler.setupDepError "gi-gobject")))
        (hsPkgs.pkgsBuildBuild.gi-glib or (pkgs.pkgsBuildBuild.gi-glib or (errorHandler.setupDepError "gi-glib")))
        (hsPkgs.pkgsBuildBuild.gi-gio or (pkgs.pkgsBuildBuild.gi-gio or (errorHandler.setupDepError "gi-gio")))
        (hsPkgs.pkgsBuildBuild.gi-pango or (pkgs.pkgsBuildBuild.gi-pango or (errorHandler.setupDepError "gi-pango")))
      ];
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell-gi-base" or (errorHandler.buildDepError "haskell-gi-base"))
          (hsPkgs."haskell-gi" or (errorHandler.buildDepError "haskell-gi"))
          (hsPkgs."haskell-gi-overloading" or (errorHandler.buildDepError "haskell-gi-overloading"))
          (hsPkgs."gi-gtk" or (errorHandler.buildDepError "gi-gtk"))
          (hsPkgs."gi-gdk" or (errorHandler.buildDepError "gi-gdk"))
          (hsPkgs."gi-atk" or (errorHandler.buildDepError "gi-atk"))
          (hsPkgs."gi-gobject" or (errorHandler.buildDepError "gi-gobject"))
          (hsPkgs."gi-glib" or (errorHandler.buildDepError "gi-glib"))
          (hsPkgs."gi-gio" or (errorHandler.buildDepError "gi-gio"))
          (hsPkgs."gi-pango" or (errorHandler.buildDepError "gi-pango"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ] ++ pkgs.lib.optional (compiler.isGhc && (compiler.version.ge "8.2" && compiler.version.lt "8.3")) (hsPkgs."haskell-gi-overloading" or (errorHandler.buildDepError "haskell-gi-overloading"));
        pkgconfig = [
          (pkgconfPkgs."libhandy-0.0" or (errorHandler.pkgConfDepError "libhandy-0.0"))
        ];
        buildable = true;
      };
    };
  }