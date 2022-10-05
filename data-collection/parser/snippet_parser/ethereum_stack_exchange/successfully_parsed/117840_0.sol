
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ManyImagesHere is ERC1155 {
    uint256[] public IMAGES;

    constructor(string[] memory images) public ERC1155("https://uri.example/api/item/{id}.json") {
        for(uint256 IMAGE_ID = 0; IMAGE_ID < images.length; IMAGE_ID++) {
            _mint(msg.sender, IMAGE_ID, 1, "");
            IMAGES.push(IMAGE_ID);
        }
    }
}
