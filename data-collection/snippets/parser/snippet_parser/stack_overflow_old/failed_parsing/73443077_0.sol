Error HH606: The project cannot be compiled, see reasons below.

These files import other files that use a different and incompatible version of Solidity:

  * contracts/periphery/interfaces/external/IWETH9.sol (=0.7.6) imports @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0)
  * contracts/periphery/interfaces/IERC20Metadata.sol (^0.7.0) imports @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0)
  * contracts/Token.sol (=0.5.16) imports @openzeppelin/contracts/token/ERC20/ERC20.sol (^0.8.0)
  * contracts/periphery/base/ERC721Permit.sol (=0.7.6) imports @openzeppelin/contracts/token/ERC721/ERC721.sol (^0.8.0) and @openzeppelin/contracts/utils/Address.sol (^0.8.1)

These files depend on other files that use a different and incompatible version of Solidity:

  * contracts/periphery/SwapRouter.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0), @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0) and 19 other files. Use --verbose to see the full list.
  * contracts/periphery/V3Migrator.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0), @openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0) and 22 other files. Use --verbose to see the full list.
  * contracts/periphery/NonfungiblePositionManager.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0), @openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0) and 38 other files. Use --verbose to see the full list.
  * contracts/periphery/NonfungibleTokenPositionDescriptor.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0), @openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0) and 13 other files. Use --verbose to see the full list.
  * contracts/periphery/libraries/PositionValue.sol (>=0.6.8 <0.8.0) depends on @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol (^0.8.0), @openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol (^0.8.0) and 6 other files. Use --verbose to see the full list.
  * contracts/periphery/examples/PairFlash.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0), @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0) and 2 other files. Use --verbose to see the full list.
  * contracts/periphery/base/LiquidityManagement.sol (=0.7.6) depends on @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0), @openzeppelin/contracts/token/ERC20/IERC20.sol (^0.8.0) and 1 other file. Use --verbose to see the full list.

These files and its dependencies cannot be compiled with your config. This can happen because they have incompatible Solidity pragmas, or don't match any of your configured Solidity compilers.

  * contracts/periphery/libraries/NFTDescriptor.sol
  * contracts/periphery/base/PeripheryPaymentsWithFee.sol
  * contracts/periphery/base/PeripheryPayments.sol

To learn more, run the command again with --verbose

Read about compiler configuration at https:
