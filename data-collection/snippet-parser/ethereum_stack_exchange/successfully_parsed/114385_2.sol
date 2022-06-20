
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/token/ERC20/ERC20.sol";


contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("NOMNOM", "MON") {
        _mint(msg.sender, initialSupply);
    }
}
