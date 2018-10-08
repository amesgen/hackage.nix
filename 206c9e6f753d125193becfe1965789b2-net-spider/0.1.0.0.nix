{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {
      server-test = false;
    } // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.10";
      identifier = {
        name = "net-spider";
        version = "0.1.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Toshio Ito <debug.ito@gmail.com>";
      author = "Toshio Ito <debug.ito@gmail.com>";
      homepage = "https://github.com/debug-ito/net-spider";
      url = "";
      synopsis = "A graph database middleware to maintain a time-varying graph.";
      description = "A graph database middleware to maintain a time-varying graph. See the [project README](https://github.com/debug-ito/net-spider) for detail.";
      buildType = "Simple";
    };
    components = {
      "net-spider" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.time)
          (hsPkgs.vector)
          (hsPkgs.greskell-websocket)
          (hsPkgs.greskell)
          (hsPkgs.aeson)
          (hsPkgs.safe-exceptions)
          (hsPkgs.text)
          (hsPkgs.unordered-containers)
          (hsPkgs.hashable)
          (hsPkgs.containers)
        ];
      };
      tests = {
        "spec" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.net-spider)
            (hsPkgs.vector)
            (hsPkgs.hspec)
          ];
        };
        "server-test-suite" = {
          depends  = pkgs.lib.optionals (_flags.server-test) [
            (hsPkgs.base)
            (hsPkgs.hspec)
            (hsPkgs.net-spider)
            (hsPkgs.vector)
            (hsPkgs.text)
            (hsPkgs.greskell-websocket)
            (hsPkgs.greskell)
            (hsPkgs.aeson)
            (hsPkgs.unordered-containers)
            (hsPkgs.text)
            (hsPkgs.hashable)
            (hsPkgs.time)
            (hsPkgs.safe-exceptions)
            (hsPkgs.hspec-need-env)
          ];
        };
      };
    };
  }