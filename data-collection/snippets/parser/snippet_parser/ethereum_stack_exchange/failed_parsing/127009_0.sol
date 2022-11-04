import "../contracts/1_AUSDC.sol";
import "../contracts/2_AToken.sol";


DeclarationError: Identifier already declared.
--> tests/2_AToken_test.sol:7:1:
|
7 | import "../contracts/2_AToken.sol";
| ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: The previous declaration is here:
--> contracts/1_AUSDC.sol:4:1:
|
4 | interface IERC20 {
| ^ (Relevant source part starts here and spans across multiple lines).
