$ /home/ionmind/hardhat-fundme-fcc/node_modules/.bin/hardhat deploy --network rinkeby
Error HH606: The project cannot be compiled, see reasons below.

These files import other files that use a different and incompatible version of Solidity:

  * contracts/test/MockV3Aggregator.sol (^0.8.12) imports @chainlink/contracts/src/v0.6/tests/MockV3Aggregator.sol (^0.6.0)

To learn more, run the command again with --verbose

Read about compiler configuration at https:
