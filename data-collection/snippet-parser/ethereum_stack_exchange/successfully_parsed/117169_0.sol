
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";

contract GameItems is ERC1155Holder {
    uint256 public constant CHARACTER = 0;
    uint256 public constant CARD = 1;
    uint256 public constant COIN = 2;

    constructor() public ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, CHARACTER, 1, "");
        _mint(msg.sender, CARD, 10**5, "");
        _mint(msg.sender, COIN, 10**18, "");
    }
}
