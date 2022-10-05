New compatible solc version available: 0.8.11
Compiling contracts...
  Solc version: 0.8.11
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

ParserError: Source file requires different compiler version (current compiler is 0.8.11+commit.d7f03943.Darwin.appleclang) - note that nightly builds are considered to be strictly less than the released version
 --> /Users/liwei/.brownie/packages/OpenZeppelin/openzeppelin-contracts@3.4.0/contracts/access/Ownable.sol:3:1:
  |
3 | pragma solidity >=0.6.0 <0.8.0;
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


ParserError: Source file requires different compiler version (current compiler is 0.8.11+commit.d7f03943.Darwin.appleclang) - note that nightly builds are considered to be strictly less than the released version
 --> /Users/liwei/.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/VRFConsumerBase.sol:2:1:
  |
2 | pragma solidity ^0.6.0;
  | ^^^^^^^^^^^^^^^^^^^^^^^
