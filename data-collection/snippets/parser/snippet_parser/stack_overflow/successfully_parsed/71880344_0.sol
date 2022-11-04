pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GameItem {
    constructor() ERC721("GameItem", "ITM") {}
}