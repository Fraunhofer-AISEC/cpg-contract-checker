
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract TestContract is ERC721Enumerable, Ownable {

    uint256 public constant MAX_TOKENS = 1;
    uint256 public constant NUM_METADATA = 4;
    uint8[NUM_METADATA][MAX_TOKENS] internal metadata;

    constructor () ERC721("TOKEN", "TKN") {
        safeMint();
        metadata[0][0] = 1;
        metadata[0][1] = 2;
        metadata[0][2] = 3;
        metadata[0][3] = 4;
    }

    function safeMint() public onlyOwner {
        _safeMint(owner(), totalSupply());
    }

    
    function getTokenMetadata(uint tokenId) public view returns (uint, uint, uint, uint){
        require(_exists(tokenId), "ERC721Metadata: Query for nonexistent token");
        require(_msgSender() == owner(), 'Unauthorized');

        return (metadata[tokenId][0], 
                metadata[tokenId][1], 
                metadata[tokenId][2], 
                metadata[tokenId][3]
                );
    }
}
