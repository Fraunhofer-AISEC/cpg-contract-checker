TypeError: Contract "GhilOracleInterface" should be marked as abstract.
 --> project:/contracts/GhilOracleInterface.sol:4:1:
  |
4 | contract GhilOracleInterface {
  | ^ (Relevant source part starts here and spans across multiple lines).
Note: Missing implementation:
 --> project:/contracts/GhilOracleInterface.sol:5:3:
  |
5 |   function getAmountAvailable() public returns (uint256);
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

,TypeError: Functions without implementation must be marked virtual.
 --> project:/contracts/GhilOracleInterface.sol:5:3:
  |
5 |   function getAmountAvailable() public returns (uint256);
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
