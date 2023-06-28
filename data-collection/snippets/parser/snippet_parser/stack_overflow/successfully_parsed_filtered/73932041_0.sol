
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract AwesomeGame is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant SWORD = 1;
    uint256 public constant CROWN = 2;

    constructor() ERC1155("https://awesomegame.com/assets/{id}.json") {
        _mint(msg.sender, GOLD, 10**18, "");
        _mint(msg.sender, SWORD, 1000, "");
        _mint(msg.sender, CROWN, 1, "");
    }
}
