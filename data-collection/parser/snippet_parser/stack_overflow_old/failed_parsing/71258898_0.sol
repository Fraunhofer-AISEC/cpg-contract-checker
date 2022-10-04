PS C:\Users\user\Documents\BC\demos\brownie_fund_me> brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.18.1 - Python development framework for Ethereum

Compiling contracts...
 Solc version: 0.6.0
 Optimizer: Enabled  Runs: 200
 EVM Version: Istanbul
CompilerError: solc returned the following errors:

C:/Users/user/.brownie/packages/smartcontractkit/chainlink-brownie- 
contracts@1.1.1/contracts/src/v0.6/interfaces/AggregatorV2V3Interface.sol:7:38: 
TypeError: Interfaces 
cannot inherit.
interface AggregatorV2V3Interface is AggregatorInterface, AggregatorV3Interface
                                 ^-----------------^

C:/Users/user/.brownie/packages/smartcontractkit/chainlink-brownie- 
contracts@1.1.1/contracts/src/v0.6/interfaces/AggregatorV2V3Interface.sol:7:59: 
TypeError: Interfaces 
cannot inherit.
interface AggregatorV2V3Interface is AggregatorInterface, AggregatorV3Interface
                                                      ^-------------------^
