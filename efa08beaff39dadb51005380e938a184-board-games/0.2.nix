{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {
      buildexamples = true;
      splitbase = true;
    } // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.14";
      identifier = {
        name = "board-games";
        version = "0.2";
      };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://code.haskell.org/~thielema/games/";
      url = "";
      synopsis = "Three games for inclusion in a web server";
      description = "Three games that might run as CGI script in a web server:\nConnect Four, Rows&Columns, Mastermind\n\nCheck running versions at\n<http://www.henning-thielemann.de/VierGewinnt> and\n<http://www.henning-thielemann.de/ZeilenSpalten>.\n\nYou can build an example web server by installing with\n\n> cabal install board-games -fbuildExamples\n\nThen start the server with\n\n> ./dist/build/board-games/board-games\n\nand play the games in your browser at the URL\n<http://localhost:8080/>.\n\nCurrently the games use German texts.\nI wanted to use gettext, but this is not thread-safe.";
      buildType = "Simple";
    };
    components = {
      "board-games" = {
        depends  = [
          (hsPkgs.html)
          (hsPkgs.cgi)
          (hsPkgs.non-empty)
          (hsPkgs.utility-ht)
          (hsPkgs.transformers)
        ] ++ (if _flags.splitbase
          then [
            (hsPkgs.containers)
            (hsPkgs.random)
            (hsPkgs.array)
            (hsPkgs.base)
          ]
          else [ (hsPkgs.base) ]);
      };
      exes = {
        "board-games" = {
          depends  = pkgs.lib.optionals (_flags.buildexamples) [
            (hsPkgs.httpd-shed)
            (hsPkgs.network-uri)
            (hsPkgs.html)
            (hsPkgs.cgi)
            (hsPkgs.non-empty)
            (hsPkgs.utility-ht)
            (hsPkgs.transformers)
            (hsPkgs.containers)
            (hsPkgs.random)
            (hsPkgs.array)
            (hsPkgs.base)
          ];
        };
      };
      tests = {
        "testsuite" = {
          depends  = [
            (hsPkgs.QuickCheck)
            (hsPkgs.non-empty)
            (hsPkgs.utility-ht)
            (hsPkgs.transformers)
            (hsPkgs.containers)
            (hsPkgs.random)
            (hsPkgs.array)
            (hsPkgs.base)
          ];
        };
      };
    };
  }