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
      specVersion = "1.10";
      identifier = { name = "file-collection"; version = "0.1.1.7"; };
      license = "BSD-3-Clause";
      copyright = "2015 Joel Williamson";
      maintainer = "joel.s.williamson@gmail.com";
      author = "Joel Williamson";
      homepage = "https://github.com/joelwilliamson/file-collection";
      url = "";
      synopsis = "Provide a uniform interface over file archives and directories";
      description = "The interface is essentially the same as that provided by\n`directory`, except each function also take reference to the\narchive/root directory it is working under, and mutating\noperations return the structure wrapped in IO.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
          (hsPkgs."zip-archive" or (errorHandler.buildDepError "zip-archive"))
        ];
        buildable = true;
      };
    };
  }