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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "Semigroup"; version = "0.0.7"; };
      license = "BSD-3-Clause";
      copyright = "2010-2011 Tony Morris";
      maintainer = "ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ";
      author = "Tony Morris";
      homepage = "https://bitbucket.org/dibblego/semigroup/";
      url = "";
      synopsis = "A semigroup";
      description = "A semigroup is a binary associative operation";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        buildable = true;
      };
    };
  }