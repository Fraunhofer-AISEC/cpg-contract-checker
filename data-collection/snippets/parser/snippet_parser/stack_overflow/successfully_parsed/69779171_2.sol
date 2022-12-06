

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract myToken is ERC721 {

    constructor() ERC721("TOKEN NAME", "TOKEN SYMBOL") {
    }

    function mint(uint256 tokenId) public {
        _mint(msg.sender, tokenId);
    }
}
