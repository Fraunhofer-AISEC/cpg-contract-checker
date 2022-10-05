

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract GameChar is ERC1155 {
    uint256 public constant CHARACTERS = 0;
 
    constructor() public ERC1155("https://game.example/api/item/{id}.json") {
              _mint(msg.sender, CHARACTERS, 1, "");
    }
}
