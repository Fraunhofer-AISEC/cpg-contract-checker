Compiler run failed
error[2333]: DeclarationError: Identifier already declared.
  --> src/UniswapV3NFTManager.sol:10:1:
   |
10 | import "./lib/PoolAddress.sol";
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: The previous declaration is here:
 --> lib/openzeppelin-contracts/contracts/utils/math/Math.sol:9:1:
  |
9 | library Math {
  | ^ (Relevant source part starts here and spans across multiple lines).
