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
      specVersion = "1.8";
      identifier = { name = "haeredes"; version = "0.5.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "Michael Orlitzky <michael@orlitzky.com>";
      author = "Michael Orlitzky";
      homepage = "http://michael.orlitzky.com/code/haeredes.xhtml";
      url = "";
      synopsis = "Confirm delegation of NS and MX records.";
      description = "Haeredes is primarily useful for ISP network administrators.\nCustomers will occasionally decide to switch hosts without alerting\nthe current host; this can cause two problems:\n\n* With NS records, the previous host (at the very least) keeps\nhosting a DNS zone that does nothing. If that host uses their\nauthoritative nameserver as a caching lookup server as well, it\nmay return incorrect results to queries about the domain in\nquestion.\n\n* For MX records, the situation is slightly worse. Most mail servers\nwill immediately accept mail for which the server thinks it is the\nultimate destination. If a mail server is configured as the\ndestination for a domain, but it is not the MX for that domain,\nthen mail submitted to that server may possibly be lost. It is\ntherefore important to remove domains from the old mail host as\nsoon as the MX record is changed.\n\nHaeredes can alert administrators when NS/MX records are changed. More\ndetail can be found in the man page.\n\n/Examples/:\n\nMake sure example.com has the expected name servers,\n[ab].iana-servers.net:\n\n@\n$ haeredes a.iana-servers.net b.iana-servers.net <<< \\\"example.com\\\"\n@\n\nIf you use --no-append-root and your nameservers are rooted, you\nmust remember to supply the trailing dot yourself. Otherwise, you'll\nget false positives.\n\n@\n$ haeredes --no-append-root \\\n&#x20;          a.iana-servers.net b.iana-servers.net \\\n&#x20;          <<< \\\"example.com\\\"\nDomain \\\"example.com\\\" delegates somewhere else: \\\"b.iana-servers.net.\\\" \\\"a.iana-servers.net.\\\"\n@\n\nCheck orlitzky.com against the expected name servers, using\nd.gtld-servers.net:\n\n@\n$ haeredes --server 199.7.91.13 dns1.viabit.com dns2.viabit.com \\\n&#x20;          <<< \\\"orlitzky.com\\\"\n@\n\nCheck orlitzky.com against only one of the expected two nameservers:\n\n@\n$ haeredes dns1.viabit.com <<< \\\"orlitzky.com\\\"\nDomain \\\"orlitzky.com.\\\" delegates somewhere else: \\\"dns2.viabit.com.\\\"\n@\n\nCheck a nonexistent domain (we provide no delegates, since we\nknow .bar will not be delegated):\n\n@\n$ haeredes <<< \\\"foo.bar\\\"\nDomain \\\"foo.bar.\\\" not delegated.\n@";
      buildType = "Simple";
    };
    components = {
      exes = {
        "haeredes" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            (hsPkgs."dns" or (errorHandler.buildDepError "dns"))
            (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
            (hsPkgs."parallel-io" or (errorHandler.buildDepError "parallel-io"))
          ];
          buildable = true;
        };
      };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."filemanip" or (errorHandler.buildDepError "filemanip"))
          ];
          buildable = true;
        };
        "shelltests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            (hsPkgs."dns" or (errorHandler.buildDepError "dns"))
            (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
            (hsPkgs."parallel-io" or (errorHandler.buildDepError "parallel-io"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          buildable = true;
        };
      };
    };
  }