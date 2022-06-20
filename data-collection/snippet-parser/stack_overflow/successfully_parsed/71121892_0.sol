pragma solidity ^0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract MyCollection is ERC721 {
    constructor() ERC721("MyCollection", "MyC") {
        _mint(msg.sender, 1);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://boredApes.com/tokens/";
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        
        string memory uri = super.tokenURI(tokenId);
        return string(abi.encodePacked(uri, ".json"));
    }
}
