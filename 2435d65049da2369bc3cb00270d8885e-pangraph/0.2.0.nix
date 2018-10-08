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
        name = "pangraph";
        version = "0.2.0";
      };
      license = "BSD-3-Clause";
      copyright = "2016-2018 Joesph Scott";
      maintainer = "joseph-scott@hotmail.co.uk";
      author = "Joe Scott";
      homepage = "https://github.com/tuura/pangraph#readme";
      url = "";
      synopsis = "A set of parsers for graph languages and conversions to\ngraph libaries.";
      description = "A package allowing parsing of graph files into graph\nlibrary datatypes. With aim the cope with large networks\nand provide translations between graph libraries. Like a\npandoc but for graphs. This is my first library so any\nfeedback and help is appreicated. For example use please\nsee the homepage.";
      buildType = "Simple";
    };
    components = {
      "pangraph" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.hexml)
          (hsPkgs.containers)
          (hsPkgs.algebraic-graphs)
          (hsPkgs.fgl)
          (hsPkgs.attoparsec)
          (hsPkgs.text)
          (hsPkgs.html-entities)
        ];
      };
      tests = {
        "pangraph-test" = {
          depends  = [
            (hsPkgs.base)
            (hsPkgs.containers)
            (hsPkgs.bytestring)
            (hsPkgs.HUnit)
            (hsPkgs.pangraph)
          ];
        };
      };
    };
  }