Warning Message:

Warning: Unused function parameter. Remove or comment out the variable name to silence this warning.
--> contracts/GabeCoin.sol:120:19:
|
120 | function mint(address account, uint256 id, uint256 amount)
| ^^^^^^^^^^^^^^^

Warning: Function state mutability can be restricted to pure
--> contracts/GabeCoin.sol:96:9:
|
96 | function uri(uint256 _tokenId) override public view returns (string memory){
| ^ (Relevant source part starts here and spans across multiple lines).
