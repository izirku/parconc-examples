This is the sample code to accompany the book *Parallel and Concurrent Programming in Haskell* (Simon Marlow, O'Reilly 2013).

To build the code on your system, you need either:

* [Stack](http://haskellstack.org)
* [A Minimal GHC installation](https://www.haskell.org/downloads)
* [The Haskell Platform](https://www.haskell.org/downloads#platform)
* [Nix Package Manager](https://nixos.org/nix/)

## Building with Stack

```
stack build
```

will build all the executables and install them in a platform-specific
subdirectory under `.stack-work/install`.

## Building with Cabal new-build

```
cabal new-build
```

## Building with Cabal

```
cabal sandbox init
cabal install --only-dependencies
cabal configure
cabal build
```

## Building with Nix / Cabal

```
nix-shell
cabal configure
cabal build
```
