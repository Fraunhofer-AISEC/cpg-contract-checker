

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Nikola is ERC721 {
    constructor() ERC721("Nikola", "NKLO") {
    }
}
