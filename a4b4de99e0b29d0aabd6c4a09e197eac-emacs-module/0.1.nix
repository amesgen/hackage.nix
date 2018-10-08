{ system
, compiler
, flags ? {}
, pkgs
, hsPkgs
, pkgconfPkgs }:
  let
    _flags = {
      assertions = false;
      module-assertions = false;
    } // flags;
  in {
    flags = _flags;
    package = {
      specVersion = "2.0";
      identifier = {
        name = "emacs-module";
        version = "0.1";
      };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sergey Vinokurov <serg.foo@gmail.com>";
      author = "Sergey Vinokurov";
      homepage = "https://github.com/sergv/emacs-module";
      url = "";
      synopsis = "Utilities to write Emacs dynamic modules";
      description = "This package provides a full set of bindings to emacs-module.h that\nallows to develop Emacs modules in Haskell.";
      buildType = "Simple";
    };
    components = {
      "emacs-module" = {
        depends  = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.deepseq)
          (hsPkgs.exceptions)
          (hsPkgs.monad-control)
          (hsPkgs.mtl)
          (hsPkgs.prettyprinter)
          (hsPkgs.resourcet)
          (hsPkgs.safe-exceptions-checked)
          (hsPkgs.text)
          (hsPkgs.template-haskell)
          (hsPkgs.transformers-base)
          (hsPkgs.vector)
          (hsPkgs.void)
        ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "8.1") (hsPkgs.bifunctors);
        build-tools = [
          (hsPkgs.buildPackages.hsc2hs)
        ];
      };
    };
  }