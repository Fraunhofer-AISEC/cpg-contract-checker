
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20FixedSupply is ERC20 {
    constructor() ERC20("Fixed", "FIX") {
        _mint(msg.sender, 1000); 
        _mint(address(this), 1000); 
    }
}
