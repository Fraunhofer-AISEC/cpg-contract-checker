PS C:\Users\me\Documents\Code\Blockchain\brownie_fundme> brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.18.1 - Python development framework for Ethereum

Compiling contracts...
  Solc version: 0.8.13
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

ParserError: Source file requires different compiler version (current compiler is 0.8.13+commit.abaa5c0e.Windows.msvc) - note that nightly builds are considered to be strictly less than the released version
 --> C:/Users/me/.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/vendor/SafeMathChainlink.sol:2:1:
  |
2 | pragma solidity ^0.6.0;
  | ^^^^^^^^^^^^^^^^^^^^^^^
