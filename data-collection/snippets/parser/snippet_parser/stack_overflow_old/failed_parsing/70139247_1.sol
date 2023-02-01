TypeError: Derived contract must override function "_burn". Two or more base classes define function with same name and parameter types.
    --> contracts/resp.sol:1185:1:
     |
1185 | contract MyNFT is ERC721, Ownable, ERC721URIStorage {
     | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ERC721":
   --> contracts/resp.sol:883:5:
    |
883 |     function _burn(uint256 tokenId) internal virtual {
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ERC721URIStorage":
    --> contracts/resp.sol:1051:5:
     |
1051 |     function _burn(uint256 tokenId) internal virtual override {
     |     ^ (Relevant source part starts here and spans across multiple lines).


TypeError: Derived contract must override function "tokenURI". Two or more base classes define function with same name and parameter types.
    --> contracts/resp.sol:1185:1:
     |
1185 | contract MyNFT is ERC721, Ownable, ERC721URIStorage {
     | ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ERC721":
   --> contracts/resp.sol:671:5:
    |
671 |     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    |     ^ (Relevant source part starts here and spans across multiple lines).
Note: Definition in "ERC721URIStorage":
    --> contracts/resp.sol:1011:5:
     |
1011 |     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
     |     ^ (Relevant source part starts here and spans across multiple lines).


Warning: Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
    --> contracts/resp.sol:1190:3:
     |
1190 |   constructor() public ERC721("MyNFT","NFT") {}
     |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https:
