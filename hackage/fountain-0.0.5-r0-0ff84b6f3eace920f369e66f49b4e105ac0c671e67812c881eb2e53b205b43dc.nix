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
      identifier = { name = "fountain"; version = "0.0.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Tom Hawkins    <tomahawkins@gmail.com>\nRubenAstudillo <ruben.astud@gmail.com>";
      author = "Tom Hawkins    <tomahawkins@gmail.com>";
      homepage = "http://tomahawkins.org";
      url = "";
      synopsis = "A fountain codec.";
      description = "Fountain codes are forward error correction codes for erasure channels.\nThey are able to recover lost packets without needing a backchannel.\nAs a rateless code, transmitters generate packets at random, on the fly.\nReceivers then listen to as many packets as needed to reconstruct the message.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
        ];
        buildable = true;
      };
    };
  }