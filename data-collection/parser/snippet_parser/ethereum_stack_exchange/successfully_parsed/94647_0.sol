
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extension/ERC721Royalty.sol";

contract MyToken is ERC721, ERC721Royalty {
    constructor() ERC721("MyToken", "MTK") {}
    
     function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable virtual override {
        
       (address artist, uint256 value) = royaltyInfo(_tokenId, msg.value);
       payable(artist).transfer(value);

       
    }
}

