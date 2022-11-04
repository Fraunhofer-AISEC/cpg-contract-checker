TypeError: Data location must be "memory" or "calldata" for parameter in function, but none was given.
--> contracts/Htoken.sol:39:24:
|
39 | function balanceOf(address [msg.sender]) public override view returns (uint256) {
| ^^^^^^^^^^^^^^^^^^^^

TypeError: Invalid array length, expected integer literal or constant expression.
--> contracts/Htoken.sol:39:33:
|
39 | function balanceOf(address [msg.sender]) public override view returns (uint256) {
| ^^^^^^^^^^
