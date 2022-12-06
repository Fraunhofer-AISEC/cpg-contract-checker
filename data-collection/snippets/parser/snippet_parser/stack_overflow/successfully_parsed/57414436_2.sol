pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20Detailed.sol";

contract Token is ERC20, ERC20Detailed {

    constructor () public ERC20Detailed("Tushar Token", "TUSHAR", 5) {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
