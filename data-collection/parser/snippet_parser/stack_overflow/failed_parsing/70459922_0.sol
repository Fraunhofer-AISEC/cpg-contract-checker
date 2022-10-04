PS D:\Python projects\Solidity dev\demo\smartcontract-lottery> brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.17.2 - Python development framework for Ethereum

Compiling contracts...
  Solc version: 0.6.12
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

C:/Users/rosne/.brownie/packages/OpenZeppelin/openzeppelin-contracts@4.3.0/contracts/access/Ownable.sol:3:1: ParserError: Source file requires different compiler version (current compiler is 0.6.12+commit.27d51765.Windows.msvc) - note that nightly builds are considered to be strictly less than the released version
pragma solidity ^0.8.0;
^---------------------^

C:/Users/rosne/.brownie/packages/smartcontractkit/chainlink-brownie-contracts@0.2.1/contracts/src/v0.8/VRFConsumerBase.sol:2:1: ParserError: Source file requires different compiler version (current compiler is 0.6.12+commit.27d51765.Windows.msvc) - note that nightly builds are considered to be strictly less than the released version
pragma solidity ^0.8.0;
^---------------------^

PS D:\Python projects\Solidity dev\demo\smartcontract-lottery>
