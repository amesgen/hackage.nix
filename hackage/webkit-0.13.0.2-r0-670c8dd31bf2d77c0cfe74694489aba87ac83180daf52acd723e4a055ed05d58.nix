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
      specVersion = "1.18";
      identifier = { name = "webkit"; version = "0.13.0.2"; };
      license = "LGPL-2.1-only";
      copyright = "(c) 2001-2013 The Gtk2Hs Team";
      maintainer = "gtk2hs-users@lists.sourceforge.net";
      author = "Cjacker Huang, Andy Stewart, Axel Simon";
      homepage = "http://projects.haskell.org/gtk2hs/";
      url = "";
      synopsis = "Binding to the Webkit library.";
      description = "WebKit is a web content engine, derived from KHTML and KJS from KDE, and\nused primarily in Apple's Safari browser.  It is made to be embedded in\nother applications, such as mail readers, or web browsers.\nIt is able to display content such as HTML, SVG, XML, and others. It also\nsupports DOM, XMLHttpRequest, XSLT, CSS, Javascript/ECMAscript and more.";
      buildType = "Custom";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."glib" or (errorHandler.buildDepError "glib"))
          (hsPkgs."pango" or (errorHandler.buildDepError "pango"))
          (hsPkgs."cairo" or (errorHandler.buildDepError "cairo"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
        ];
        pkgconfig = [
          (pkgconfPkgs."webkit-1.0" or (errorHandler.pkgConfDepError "webkit-1.0"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.gtk2hsC2hs.components.exes.gtk2hsC2hs or (pkgs.pkgsBuildBuild.gtk2hsC2hs or (errorHandler.buildToolDepError "gtk2hsC2hs:gtk2hsC2hs")))
          (hsPkgs.pkgsBuildBuild.gtk2hsHookGenerator.components.exes.gtk2hsHookGenerator or (pkgs.pkgsBuildBuild.gtk2hsHookGenerator or (errorHandler.buildToolDepError "gtk2hsHookGenerator:gtk2hsHookGenerator")))
          (hsPkgs.pkgsBuildBuild.gtk2hsTypeGen.components.exes.gtk2hsTypeGen or (pkgs.pkgsBuildBuild.gtk2hsTypeGen or (errorHandler.buildToolDepError "gtk2hsTypeGen:gtk2hsTypeGen")))
        ];
        buildable = true;
      };
    };
  }