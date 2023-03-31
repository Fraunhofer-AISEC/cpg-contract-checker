 pragma solidity ^0.8.15;

 import "erc721a/contracts/ERC721A.sol";

 contract testNFTRun is ERC721A {

     constructor() ERC721("testNFTRun", "TNFTR") {}


     function mint(uint256 quantity) external payable {
         
         require(msg.sender == ownerOf(), "Only contract owner can mint NFTs");
         _mint(msg.sender, quantity);
     }


       function _baseURI() override internal view virtual returns (string memory) {
         return "ipfs://bafybeifgxh2lo3jpx6xg2bl3wlnifgpahcdvmktl42jz7d7m7x7y6yap3i/";
     }
 }
