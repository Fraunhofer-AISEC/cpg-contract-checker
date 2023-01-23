pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TrainingResults is ERC721 {
    constructor() ERC721("TrainingResults", "TR") {}

    function _beforeTokenTransfer(address from,address to, uint256 tokenId) override internal {
        
        
        require(msg.sender == address(0x123), "Cannot transfer tokens");
    }
}
