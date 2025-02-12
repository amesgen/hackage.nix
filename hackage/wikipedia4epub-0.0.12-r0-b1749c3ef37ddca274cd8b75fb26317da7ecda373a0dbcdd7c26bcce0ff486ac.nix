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
      identifier = { name = "wikipedia4epub"; version = "0.0.12"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "radoslav.dorcik@gmail.com";
      author = "Radoslav Dorcik <radoslav.dorcik@gmail.com>";
      homepage = "http://rampa.sk/static/wikipedia4epub.html";
      url = "";
      synopsis = "Wikipedia EPUB E-Book construction from Firefox history.";
      description = "\nWikipedia EPUB E-Book construction from Firefox History.\nIt dumps history and select only wikipedia articles, fetch\nthem and strip thier content before put into EPUB book\nfor E-Book readers.\n";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          (hsPkgs."url" or (errorHandler.buildDepError "url"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."epub" or (errorHandler.buildDepError "epub"))
          (hsPkgs."regex-posix" or (errorHandler.buildDepError "regex-posix"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."regex-base" or (errorHandler.buildDepError "regex-base"))
          (hsPkgs."tagsoup" or (errorHandler.buildDepError "tagsoup"))
          (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
          (hsPkgs."zip-archive" or (errorHandler.buildDepError "zip-archive"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
        ];
        buildable = true;
      };
      exes = { "wiki4e-mkepub-subtree" = { buildable = true; }; };
    };
  }