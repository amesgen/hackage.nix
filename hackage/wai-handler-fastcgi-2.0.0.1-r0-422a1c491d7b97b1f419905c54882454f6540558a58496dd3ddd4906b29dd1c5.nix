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
      identifier = { name = "wai-handler-fastcgi"; version = "2.0.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman <michael@snoyman.com>";
      homepage = "http://www.yesodweb.com/book/web-application-interface";
      url = "";
      synopsis = "Wai handler to fastcgi";
      description = "Calls out to the libfcgi C library.";
      buildType = "Configure";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        libs = [ (pkgs."fcgi" or (errorHandler.sysDepError "fcgi")) ];
        buildable = true;
      };
    };
  }