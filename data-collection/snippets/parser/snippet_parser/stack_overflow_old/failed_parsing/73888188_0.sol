Error HH606: The project cannot be compiled, see reasons below.

The Solidity version pragma statement in these files doesn't match any of the configured compilers in your config. Change the pragma or configure additional compiler versions in your hardhat config.

  * @openzeppelin/contracts/token/ERC20/ERC20.sol (^0.7.0)
  * @openzeppelin/contracts/math/SafeMath.sol (^0.7.0)
  * @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.7.0)

These files import other files that use a different and incompatible version of Solidity:

  * contracts/MarketOrder.sol (^0.8.8) imports @openzeppelin/contracts/token/ERC20/ERC20.sol (^0.7.0)

These files and its dependencies cannot be compiled with your config. This can happen because they have incompatible Solidity pragmas, or don't match any of your configured Solidity compilers.

  * @uniswap/v3-periphery/contracts/libraries/TransferHelper.sol

To learn more, run the command again with --verbose

Read about compiler configuration at https:
