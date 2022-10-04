pragma solidity ^0.5.2;

import "../token/ERC20/ERC20.sol";
import "../token/ERC20/ERC20Detailed.sol";


contract SimpleToken is ERC20, ERC20Detailed {
    uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(DECIMALS));

    
    constructor () public ERC20Detailed("SimpleToken", "SIM", DECIMALS) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}
