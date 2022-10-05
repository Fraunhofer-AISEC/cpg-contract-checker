
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract GToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20("GToken", "GTKN") public {
        _mint(msg.sender, 1000000 * 10 ** decimals()); 
    }
}
