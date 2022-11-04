pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor (uint256 initialSupply) ERC20("MyToken", "MY") {
        _mint(msg.sender, initialSupply * 10 ** 18);
    }
}
