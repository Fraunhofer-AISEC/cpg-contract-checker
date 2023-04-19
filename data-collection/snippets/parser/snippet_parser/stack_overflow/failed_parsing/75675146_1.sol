Warning: This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
  --> @solidstate/contracts/proxy/Proxy.sol:11:1:
   |
11 | abstract contract Proxy is IProxy {
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: The payable fallback function is defined here.
  --> @solidstate/contracts/proxy/Proxy.sol:28:5:
   |
28 |     fallback() external payable virtual {
   |     ^ (Relevant source part starts here and spans across multiple lines).


Warning: This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
 --> @solidstate/contracts/proxy/diamond/fallback/IDiamondFallback.sol:7:1:
  |
7 | interface IDiamondFallback is IDiamondBase {
  | ^ (Relevant source part starts here and spans across multiple lines).
Note: The payable fallback function is defined here.
 --> @solidstate/contracts/proxy/IProxy.sol:8:5:
  |
8 |     fallback() external payable;
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
  --> @solidstate/contracts/proxy/diamond/base/DiamondBase.sol:13:1:
   |
13 | abstract contract DiamondBase is IDiamondBase, Proxy {
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: The payable fallback function is defined here.
  --> @solidstate/contracts/proxy/Proxy.sol:28:5:
   |
28 |     fallback() external payable virtual {
   |     ^ (Relevant source part starts here and spans across multiple lines).


Warning: This contract has a payable fallback function, but no receive ether function. Consider adding a receive ether function.
  --> @solidstate/contracts/proxy/diamond/fallback/DiamondFallback.sol:15:1:
   |
15 | abstract contract DiamondFallback is
   | ^ (Relevant source part starts here and spans across multiple lines).
Note: The payable fallback function is defined here.
  --> @solidstate/contracts/proxy/Proxy.sol:28:5:
   |
28 |     fallback() external payable virtual {
   |     ^ (Relevant source part starts here and spans across multiple lines).


Generating typings for: 1 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 40 typings!
Compiled 1 Solidity file successfully
Error HH700: Artifact for contract "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol:AggregatorV3Interface" not found.
