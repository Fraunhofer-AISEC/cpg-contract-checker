pragma solidity ^0.8.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/…";

contract VIRUSONE is ERC20 {
    constructor(uint256 initialSupply) public ERC20 ("VIRUSONE", "VONE") {
        _mint(msg.sender, initialSupply);
    }
}
