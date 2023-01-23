
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract VolcanoNFT is ERC721("Volcano", "VOL") {
 uint256 tokenId;
 constructor() {

}

function mint() public {
    _safeMint(msg.sender, tokenId);
    tokenId++;
}

function transfer() public {
}
}
