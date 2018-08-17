{ mkDerivation, abstract-par, accelerate, alex, array, async, base
, binary, bytestring, containers, deepseq, directory
, distributed-process, distributed-process-simplelocalnet
, distributed-static, filepath, happy, http-conduit, monad-par
, network, network-uri, normaldistribution, parallel, random, repa
, stdenv, stm, template-haskell, time, transformers, utf8-string
, vector, xml
}:
mkDerivation {
  pname = "parconc-examples";
  version = "0.4.6";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    abstract-par accelerate array async base binary bytestring
    containers deepseq directory distributed-process
    distributed-process-simplelocalnet distributed-static filepath
    http-conduit monad-par network network-uri normaldistribution
    parallel random repa stm template-haskell time transformers
    utf8-string vector xml
  ];
  executableToolDepends = [ alex happy ];
  homepage = "http://github.com/simonmar/parconc-examples";
  description = "Examples to accompany the book \"Parallel and Concurrent Programming in Haskell\"";
  license = stdenv.lib.licenses.bsd3;
}
