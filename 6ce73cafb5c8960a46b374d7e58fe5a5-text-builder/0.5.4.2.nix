{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {} // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.10";
      identifier = {
        name = "text-builder";
        version = "0.5.4.2";
      };
      license = "MIT";
      copyright = "(c) 2017, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/text-builder";
      url = "";
      synopsis = "An efficient strict text builder";
      description = "";
      buildType = "Simple";
    };
    components = {
      "text-builder" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.base-prelude)
          (hsPkgs.bytestring)
          (hsPkgs.semigroups)
          (hsPkgs.text)
        ];
      };
      tests = {
        "test" = {
          depends  = [
            (hsPkgs.QuickCheck)
            (hsPkgs.quickcheck-instances)
            (hsPkgs.rerebase)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
            (hsPkgs.tasty-quickcheck)
            (hsPkgs.text-builder)
          ];
        };
      };
      benchmarks = {
        "benchmark-text" = {
          depends  = [
            (hsPkgs.criterion)
            (hsPkgs.rerebase)
            (hsPkgs.text-builder)
          ];
        };
        "benchmark-char" = {
          depends  = [
            (hsPkgs.criterion)
            (hsPkgs.rerebase)
            (hsPkgs.text-builder)
          ];
        };
      };
    };
  }