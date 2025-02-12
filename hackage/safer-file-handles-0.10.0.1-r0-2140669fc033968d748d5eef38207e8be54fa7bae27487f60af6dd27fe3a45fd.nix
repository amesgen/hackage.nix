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
      identifier = { name = "safer-file-handles"; version = "0.10.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2010-2011 Bas van Dijk";
      maintainer = "Bas van Dijk <v.dijk.bas@gmail.com>";
      author = "Bas van Dijk";
      homepage = "https://github.com/basvandijk/safer-file-handles/";
      url = "";
      synopsis = "Type-safe file handling";
      description = "This package adds three safety features on top of the regular\n@System.IO@ file handles and operations:\n\n* Regional file handles. Files must be opened in a /region/. When\nthe region terminates all opened files are automatically\nclosed. The main advantage of regions is that the handles to\nthe opened files can not be returned from the region which\nensures no I/O with closed files is possible.\n\n* Explicit IOModes. The regional file handles are parameterized\nby the IOMode in which they were opened. All operations on\nhandles explicitly specify the needed IOMode. This way it is\nimpossible to read from a write-only handle or write to a\nread-only handle for example.\n\n* Type-safe filepath creation and manipulation\nusing the @pathtype@ package.\n\nThe primary technique used in this package is called \\\"Lightweight\nmonadic regions\\\" which was invented by Oleg Kiselyov and\nChung-chieh Shan. See:\n\n<http://okmij.org/ftp/Haskell/regions.html#light-weight>\n\nThis technique is implemented in the @regions@ package which is\nre-exported from @safer-file-handles@.\n\nSee the @safer-file-handles-examples@ package for examples how\nto use this package:\n\n@git clone <https://github.com/basvandijk/safer-file-handles-examples>@\n\nSee the @safer-file-handles-bytestring/text@ package for\n@ByteString/Text@ operations on regional file handles.";
      buildType = "Custom";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (errorHandler.buildDepError "base-unicode-symbols"))
          (hsPkgs."regions" or (errorHandler.buildDepError "regions"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."explicit-iomodes" or (errorHandler.buildDepError "explicit-iomodes"))
          (hsPkgs."pathtype" or (errorHandler.buildDepError "pathtype"))
          (hsPkgs."regional-pointers" or (errorHandler.buildDepError "regional-pointers"))
        ];
        buildable = true;
      };
    };
  }