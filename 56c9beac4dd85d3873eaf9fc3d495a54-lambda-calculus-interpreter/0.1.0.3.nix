{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {
      ci = false;
    } // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "1.10";
      identifier = {
        name = "lambda-calculus-interpreter";
        version = "0.1.0.3";
      };
      license = "BSD-3-Clause";
      copyright = "2018 Author name here";
      maintainer = "example@example.com";
      author = "Author name here";
      homepage = "https://github.com/githubuser/lambda-calculus-interpreter#readme";
      url = "";
      synopsis = "Lambda Calculus interpreter";
      description = "Please see the README on GitHub at <https://github.com/githubuser/lambda-calculus-interpreter#readme>";
      buildType = "Simple";
    };
    components = {
      "lambda-calculus-interpreter" = {
        depends  = [ (hsPkgs.base) ];
      };
      exes = {
        "lci" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.lambda-calculus-interpreter)
          ];
        };
      };
      tests = {
        "lambda-calculus-interpreter-test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.lambda-calculus-interpreter)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
          ];
        };
      };
    };
  }