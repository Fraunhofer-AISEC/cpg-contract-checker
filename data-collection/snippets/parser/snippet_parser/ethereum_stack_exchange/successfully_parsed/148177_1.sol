
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CAFToken is ERC20 {
    constructor(
        uint256 initialSupply,
        address cafeAddress
    ) ERC20("Cafe", "CAF") {
        _mint(cafeAddress, initialSupply); 
    }
}

