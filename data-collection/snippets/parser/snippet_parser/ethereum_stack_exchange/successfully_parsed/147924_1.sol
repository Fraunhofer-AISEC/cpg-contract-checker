pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";

contract Azuki is ERC721A {
    constructor() ERC721A("Azuki", "AZUKI") {}

    function mint(uint256 quantity) external payable {
        
        _mint(msg.sender, quantity);
    }
}
