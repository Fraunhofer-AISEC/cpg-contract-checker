PS C:\Bharath\src\crypto\python\demos\boss\brow2\brownie_fund_me> brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.17.2 - Python development framework for Ethereum

865kiB [00:01, 509kiB/s]
WARNING: Unable to compile smartcontractkit/chainlink-brownie-contracts@1.1.1 due to a UnicodeDecodeError - you may still be able to import sources from the package, but will be unable to load the package directly.

Compiling contracts...
  Solc version: 0.6.12
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

contracts/FundMe.sol:5:1: ParserError: Source "C:/Users/チEôェバラト！EharathTV��.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol" not found: File outside of allowed directories.
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
^--------------------------------------------------------------------------^

contracts/FundMe.sol:6:1: ParserError: Source "C:/Users/チEôェバラト！EharathTV��.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/vendor/SafeMathChainlink.sol" not found: File outside of allowed directories.
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";
^------------------------------------------------------------------^

contracts/test/MockV3Aggregator.sol:4:1: ParserError: Source "C:/Users/チEôェバラト！EharathTV��.brownie/packages/smartcontractkit/chainlink-brownie-contracts@1.1.1/contracts/src/v0.6/interfaces/AggregatorV2V3Interface.sol" not found: File outside of allowed directories.
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV2V3Interface.sol";