DeclarationError: Identifier already declared.
--> contracts/SimpleStorage.sol:17:5:
|
17 | People[] public people;
| ^^^^^^^^^^^^^^^^^^^^^^
Note: The previous declaration is here:
--> contracts/SimpleStorage.sol:11:5:
|
11 | struct people {
| ^ (Relevant source part starts here and spans across multiple lines).

from solidity:
DeclarationError: Identifier not found or not unique.
--> contracts/SimpleStorage.sol:17:5:
|
17 | People[] public people;
| ^^^^^^
