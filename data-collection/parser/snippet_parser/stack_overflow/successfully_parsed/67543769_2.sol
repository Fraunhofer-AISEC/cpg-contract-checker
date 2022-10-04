

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Color is ERC721Enumerable {
    string[] public colors;
    mapping(string => bool) _colorExists;

    constructor() ERC721("Color", "COLOR")  {
    }

    function mint(string memory _color) public {
        colors.push(_color);
        uint _id = colors.length;
        _mint(msg.sender, _id);
        _colorExists[_color] = true;

    }
}
