pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol"; 

contract color is ERC721 {
    string[] public colors;
    mapping(string => bool) _colorExists; 
    constructor() ERC721("Color", "COLOR") {
    }

    function mint(string memory _color) public{
      colors.push(_color);
      uint _id = colors.length -1;

      _mint(msg.sender,_id);
      _colorExists[_color] = true;
 
    }
}
