Brownie v1.19.2 - Python development framework for Ethereum

New compatible solc version available: 0.8.0
Compiling contracts...
  Solc version: 0.8.0
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

ParserError: Source "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol" not found: File outside of allowed directories.
  --> contracts/FundMe.sol:15:1:
   |
15 | import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

