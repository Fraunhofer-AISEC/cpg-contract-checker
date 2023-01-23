PS E:\NFT-DEMO> brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.16.4 - Python development framework for Ethereum

Compiling contracts...
  Solc version: 0.6.6
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

contracts/AdvancedCollectible.sol:6:1: ParserError: Source "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol" not found: File outside of allowed directories.
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
