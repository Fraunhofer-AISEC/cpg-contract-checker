
pragma solidity ^0.8.15;

import "./ERC721Creator.sol";

contract MockNFT is ERC721Creator {
    constructor() ERC721Creator("name", "symbol", msg.sender) {}
}
