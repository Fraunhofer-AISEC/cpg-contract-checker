
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestERC20Token is ERC20 {
    constructor(uint256 initialSupply) ERC20("Test Coin", "TEST") {
        _mint(msg.sender, initialSupply * (10 ** 18));
    }
}
