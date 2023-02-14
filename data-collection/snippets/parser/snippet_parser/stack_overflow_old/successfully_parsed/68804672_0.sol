pragma solidity >=0.4.21 <0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract color is ERC721 {
    constructor() ERC721("color", "COLOR") {
    }
}
