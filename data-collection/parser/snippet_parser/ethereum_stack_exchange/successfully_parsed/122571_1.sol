
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TestC is ERC20{
    constructor(uint256 initialSupply) ERC20("TestC", "ALPH") {
        _mint(msg.sender, initialSupply);
    }
    
}
