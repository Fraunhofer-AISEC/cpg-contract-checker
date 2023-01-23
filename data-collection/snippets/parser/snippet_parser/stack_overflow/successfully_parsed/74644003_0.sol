
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Nft is ERC721 {
    string public constant TOKEN_URI =
        "ipfs://...";
    uint256 private s_tokenCounter;

    constructor() ERC721("NFT", "NFT") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        s_tokenCounter = s_tokenCounter + 1;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
