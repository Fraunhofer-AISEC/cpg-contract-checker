

pragma solidity >=0.6.0 <0.8.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721 {
     using Counters for Counters.Counter;
     Counters.Counter private _tokenIds;
     constructor() ERC721("MyNFT", "MNFT") {}

     function mintNFT(string memory tokenURI) public returns (uint256) {
       _tokenIds.increment();
       uint256 newItemId = _tokenIds.current();
       _safeMint(msg.sender, newItemId);
       _setTokenURI(newItemId, tokenURI);
       return newItemId;
   }
}
