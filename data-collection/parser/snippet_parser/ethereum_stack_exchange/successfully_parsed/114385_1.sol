
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract secret is ERC20 {
    constructor(uint256 initialsupply) public ERC20 ("secret", "secret") {
        _mint(msg.sender, initialSupply);
    }
}
