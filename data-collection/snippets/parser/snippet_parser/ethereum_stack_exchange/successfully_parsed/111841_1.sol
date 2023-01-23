pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC1155, Ownable {
    constructor() ERC1155("JSON FILE WITH METADATA") {
        _mint(msg.sender,1,1,"");
    }
}