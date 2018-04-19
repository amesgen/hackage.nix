{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      debug = false;
      fastc = false;
      misc-executables = false;
      monitoring = false;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "second-transfer";
          version = "0.10.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright 2015, Alcides Viamontes Esquivel";
        maintainer = "alcidesv@zunzun.se";
        author = "Alcides Viamontes Esquivel";
        homepage = "https://www.httptwo.com/second-transfer/";
        url = "";
        synopsis = "Second Transfer HTTP/2 web server";
        description = "Second Transfer HTTP/2 web server";
        buildType = "Simple";
      };
      components = {
        second-transfer = {
          depends  = [
            hsPkgs.base
            hsPkgs.exceptions
            hsPkgs.bytestring
            hsPkgs.base16-bytestring
            hsPkgs.network
            hsPkgs.network-uri
            hsPkgs.text
            hsPkgs.binary
            hsPkgs.containers
            hsPkgs.conduit
            hsPkgs.transformers
            hsPkgs.network-uri
            hsPkgs.hashtables
            hsPkgs.lens
            hsPkgs.http2
            hsPkgs.hashable
            hsPkgs.attoparsec
            hsPkgs.clock
            hsPkgs.resourcet
            hsPkgs.BoundedChan
            hsPkgs.pqueue
            hsPkgs.stm
            hsPkgs.deepseq
            hsPkgs.time
            hsPkgs.vector
            hsPkgs.vector-algorithms
            hsPkgs.mmorph
          ] ++ pkgs.lib.optionals _flags.monitoring [
            hsPkgs.hedis
            hsPkgs.unix
          ];
          libs = (pkgs.lib.optional system.isOsx pkgs.second_transfer__enable_tls ++ pkgs.lib.optional system.isLinux pkgs."stdc++") ++ pkgs.lib.optional (_flags.fastc && system.isLinux) pkgs."botan-1.11";
        };
        tests = {
          hunit-tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.conduit
              hsPkgs.lens
              hsPkgs.HUnit
              hsPkgs.bytestring
              hsPkgs.http2
              hsPkgs.network
              hsPkgs.text
              hsPkgs.binary
              hsPkgs.containers
              hsPkgs.network-uri
              hsPkgs.hashtables
              hsPkgs.unordered-containers
              hsPkgs.transformers
              hsPkgs.second-transfer
              hsPkgs.stm
            ];
          };
        };
      };
    }