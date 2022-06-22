Compiling contracts...
  Solc version: 0.6.6
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

/home/botvenom/.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.4/vendor/StandardToken.sol:56:56: ParserError: The state mutability modifier "constant" was removed in version 0.5.0. Use "view" or "pure" instead.
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
                                                       ^------^

/home/botvenom/.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.4/interfaces/ERC677.sol:1:1: ParserError: Source file requires different compiler version (current compiler is 0.6.6+commit.6c089d02.Linux.g++ - note that nightly builds are considered to be strictly less than the released version
pragma solidity ^0.4.8;
^---------------------^
