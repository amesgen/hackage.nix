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
      specVersion = "1.0";
      identifier = { name = "TCache"; version = "0.9.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "agocorona@gmail.com";
      author = "Alberto Gómez Corona";
      homepage = "";
      url = "";
      synopsis = "A Transactional cache with user-defined persistence";
      description = "TCache is a transactional cache with configurable persitence. It allows conventional\nSTM transactions for objects that syncronize  with\ntheir user defined storages. Default persistence in files is provided for testing purposes\nState in memory and into permanent storage is transactionally coherent.\n0.9.0.1 : Solves a bug when object keys generate invalid filenames.\nchanges in defaultPersistence to further separate serialization from input-output\n\n0.9: This version now has full text search. Serialization is now trough byteStrings\n\nThis version support  the backward compatible stuff, that permits transparent\nretrievals of objects and transcactions between objects without directly using STM references\n('with*Resource(s)' calls), Now it goes in the oposite direction by providing explicit STM persistent\nreferences (called 'DBRefś') that leverage the nice and traditional haskell reference syntax\nfor performing database transactions.\n\n'DBRef's are in essence, persistent TVars indexed in the cache, with a traditional 'readDBRef',\n'writeDBRef' Haskell interface in the STM monad.\nAdditionally, because DBRefs are serializable, they can be embeded in serializable registers.\nBecause they are references,they point to other serializable registers.\nThis permits persistent mutable and efficient Inter-object relations.\n\nTriggers are also included in this release. They are user defined hooks that are called back on register updates. That can be used for\neasing the actualization of inter-object relations and also permit more higuer level\nand customizable accesses. The internal indexes used for the query language uses triggers.\n\nIt also  implements an straighforwards non-intrusive pure-haskell type safe query language  based\non register field relations. This module must be imported separately. See\n\"Data.TCache.IndexQuery\" for further information\n\nNow the file persistence is more reliable.The IO reads are safe inside STM transactions.\n\nTo ease the implementation of other user-defined persistence, \"Data.TCache.DefaultPersistence\" needed\nto be imported  explcitly for deriving file persistence instances.\n\nThe 0.9 version adds full text indexation and search, incorporated in the experimental query language\n\nIt also changes the default Persistence mechanism. Now ByteStrings are used for serialization and deserialization\n. a Serializable class and a Persist structure decouple serialization to/from bytestring\nand write-read to file. Both can be redefined separately, so default persistence can be changed with `setPersist`\nto write to blobs in databases, for example. Default persistence has'nt to be in files.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        buildable = true;
      };
    };
  }