{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {
      buildexample = false;
    } // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.10";
      identifier = {
        name = "servant-rawm";
        version = "0.3.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "2017 Dennis Gosnell";
      maintainer = "cdep.illabout@gmail.com";
      author = "Dennis Gosnell";
      homepage = "https://github.com/cdepillabout/servant-rawm";
      url = "";
      synopsis = "Embed a raw 'Application' in a Servant API";
      description = "Please see <https://github.com/cdepillabout/servant-rawm#readme README.md>.";
      buildType = "Simple";
    };
    components = {
      "servant-rawm" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.filepath)
          (hsPkgs.http-client)
          (hsPkgs.http-media)
          (hsPkgs.http-types)
          (hsPkgs.lens)
          (hsPkgs.resourcet)
          (hsPkgs.servant-client)
          (hsPkgs.servant-docs)
          (hsPkgs.servant-server)
          (hsPkgs.wai)
          (hsPkgs.wai-app-static)
          (hsPkgs.servant-client-core)
        ];
      };
      exes = {
        "servant-rawm-example-client" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.http-client)
            (hsPkgs.http-media)
            (hsPkgs.http-types)
            (hsPkgs.servant)
            (hsPkgs.servant-rawm)
            (hsPkgs.servant-client)
            (hsPkgs.servant-client-core)
            (hsPkgs.text)
          ];
        };
        "servant-rawm-example-docs" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.servant)
            (hsPkgs.servant-rawm)
            (hsPkgs.servant-docs)
            (hsPkgs.text)
          ];
        };
        "servant-rawm-example-server" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.servant)
            (hsPkgs.servant-rawm)
            (hsPkgs.servant-server)
            (hsPkgs.transformers)
            (hsPkgs.wai)
            (hsPkgs.warp)
          ];
        };
      };
      tests = {
        "servant-rawm-doctest" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.doctest)
            (hsPkgs.Glob)
          ];
        };
        "servant-rawm-test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.hspec-wai)
            (hsPkgs.http-client)
            (hsPkgs.http-media)
            (hsPkgs.http-types)
            (hsPkgs.servant)
            (hsPkgs.servant-client)
            (hsPkgs.servant-client-core)
            (hsPkgs.servant-rawm)
            (hsPkgs.servant-server)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hspec)
            (hsPkgs.tasty-hunit)
            (hsPkgs.text)
            (hsPkgs.transformers)
            (hsPkgs.wai)
            (hsPkgs.warp)
          ];
        };
      };
    };
  }