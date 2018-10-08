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
      specVersion = "1.24";
      identifier = {
        name = "hjugement";
        version = "2.0.0.20180903";
      };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Julien Moutinho <julm+hjugement@autogeree.net>";
      author = "Julien Moutinho <julm+hjugement@autogeree.net>";
      homepage = "";
      url = "";
      synopsis = "Majority Judgment.";
      description = "A library for the <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D Majority Judgment>.\n\nThe Majority Judgment is <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D judged by its authors>\nto be “superior to any known method of voting\nand to any known method of judging competitions,\nin theory and in practice”.\n\nFor introductory explanations, you can read:\n\n* the accompanying README.md file (en),\n* Marjolaine Leray's comic: <https://www.lechoixcommun.fr/articles/Vous_reprendrez_bien_un_peu_de_democratie-2.html Vous reprendrez bien un peu de démocratie ?> (fr),\n* the dedicated web sites: <https://mieuxvoter.fr> and <https://lechoixcommun.fr>,\n* or watch: Rida Laraki's conference: <https://mixitconf.org/2017/majority-judgment Le Jugement Majoritaire> (fr).\n\nFor comprehensive studies, you can read Michel Balinski and Rida Laraki's:\n\n* textbook: <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D Majority Judgment: Measuring, Ranking, and Electing> (en)\n* cahier: <http://www.lamsade.dauphine.fr/sites/default/IMG/pdf/cahier_377.pdf Majority Judgment vs. Majority Rule> (en)\n* paper: <https://1007421605497013616-a-1802744773732722657-s-sites.googlegroups.com/site/ridalaraki/xfiles/BalinskiLarakiJudgeDontVotecahierderecherche2010-27.pdf Judge : Don't Vote!> (en)\n* article: <https://www.cairn.info/revue-francaise-d-economie-2012-4-page-11.htm Jugement majoritaire versus vote majoritaire (via les présidentielles 2011-2012)> (fr)";
      buildType = "Simple";
    };
    components = {
      "hjugement" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.containers)
          (hsPkgs.hashable)
          (hsPkgs.unordered-containers)
        ];
      };
      tests = {
        "hjugement-test" = {
          depends  = [
            (hsPkgs.hjugement)
            (hsPkgs.base)
            (hsPkgs.containers)
            (hsPkgs.hashable)
            (hsPkgs.QuickCheck)
            (hsPkgs.random)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hunit)
            (hsPkgs.tasty-quickcheck)
            (hsPkgs.text)
            (hsPkgs.transformers)
            (hsPkgs.unordered-containers)
          ];
        };
      };
    };
  }